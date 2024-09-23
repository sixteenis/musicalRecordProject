//
//  MainVM.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/21/24.
//

import Foundation
import Combine


final class MainVM: ViewModeltype {
    var cancellables = Set<AnyCancellable>()
    var input = Input()
    @Published var output = Output()
    struct Input {
        let viewOnTask = PassthroughSubject<Void,Never>()
        let dateSet = CurrentValueSubject<Date, Never>(Date()) //날짜 선택
        let showTypeSet = CurrentValueSubject<Genre, Never>(.play) // 공연 타입 선택
        let selectCell = CurrentValueSubject<UUID, Never>(UUID()) // 셀 클릭 시
    }
    struct Output {
        var setDate = Date() //날짜 세팅
        var showType = Genre.play // 공연 타입 세팅
        var selectCellId: UUID = UUID() // 현재 선택한 셀
        var showDatas = [PerformanceModel]() // 현재 공연 데이터들
    }
    init() {
        transform()
    }
    func transform() {
        input.viewOnTask
            .sink { [weak self] _ in
                guard let self else { return }
                self.viewOnTask()
            }.store(in: &cancellables)
        input.dateSet
            .sink { [weak self] date in
                guard let self else { return }
                self.output.setDate = date
            }.store(in: &cancellables)
        input.showTypeSet
            .sink { [weak self] type in
                guard let self else { return }
                self.output.showType = type
            }.store(in: &cancellables)
        input.selectCell
            .sink { [weak self] id in
                guard let self else { return }
                self.output.selectCellId = id
            }.store(in: &cancellables)
        
    }
    
    
}
// MARK: - 뷰가 뜰 때
private extension MainVM {
    func viewOnTask() {
        if output.showDatas.isEmpty {
            Task {
                await self.updatePerformanceList()
            }
        }
    }
}
private extension MainVM {
    // MARK: - 공연 데이터 초기화 시켜주는 함수
    func updatePerformanceList() async {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateString = dateFormatter.string(from: output.setDate)
        do {
            // MARK: - page 변경해서 페이지네이션 기능 구현해줘야됨!
            
             let data = try await NetworkManager.shared.requestPerformance(date: dateString, genreType: output.showType, page: "1").map {$0.transformperformanceModel()}
            DispatchQueue.main.async {
                self.output.showDatas = data
                self.checkDetailPerformancData(model: self.output.showDatas[0])
            }
            
        } catch {
            print("오류 에러처리해주자!!!")
        }
        
    }
    // MARK: - 디테일 데이터 유무 판별
    func checkDetailPerformancData(model: PerformanceModel) {
        if model.detail == nil { //디테일 부분이 빈경우
            Task {
                await self.updateDetailPerformanc(model)
            }
        } else { //이미 디테일 데이터를 가진 경우
            self.output.selectCellId = model.id
        }
    }
    // MARK: - 디테일 데이터 없을 경우 네트워킹하기
    func updateDetailPerformanc(_ model: PerformanceModel) async {
        do {
            let data = try await NetworkManager.shared.requestDetailPerformance(performanceId: model.simple.playId).transformDetailModel()
            if let index = self.output.showDatas.firstIndex(where: {$0.id == model.id}) {
                DispatchQueue.main.async {
                    self.output.showDatas[index].detail = data
                    self.output.selectCellId = model.id
                }
            }
        } catch {
            print("디테일 데이터 가져오기 에러처리 해주기")
        }
    }
    
}
