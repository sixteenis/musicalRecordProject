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
        let dateSet = CurrentValueSubject<Date, Never>(Date())
        let showTypeSet = CurrentValueSubject<Genre, Never>(.play)
        let selectCell = PassthroughSubject<UUID, Never>()
    }
    struct Output {
        var setDate = Date()
        var showType = Genre.play
        var selectCellId: UUID = UUID()
        var showDatas = PerformanceModel.mockupData
    }
    init() {
        transform()
    }
    func transform() {
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
    enum Action {
        case setDate(date: Date)
        case setType(type: Genre)
    }
    func action(_ action: Action) {
        switch action {
        case .setDate:
            print("123")
        case .setType:
            print("타입선택")
        //case .setType(type: <#T##SelectType#>)
        }
    }
    
    
}
