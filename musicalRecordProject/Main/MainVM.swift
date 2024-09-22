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
        let dateSet = PassthroughSubject<Date, Never>()
        let showTypeSet = PassthroughSubject<SelectType, Never>()
        let selectCell = PassthroughSubject<Int, Never>()
    }
    struct Output {
        var setDate = Date()
        var showType = SelectType.performance
        var selectCellIndex = 0
        var showDatas = [0,1,2,3,4,5,6,7,8,9,10]
    }
    init() {
        transform()
    }
    func transform() {
        input.dateSet
            .sink { [weak self] date in
                guard let self else { return }
                self.output.setDate = date
                print(date)
            }.store(in: &cancellables)
        input.showTypeSet
            .sink { [weak self] type in
                guard let self else { return }
                self.output.showType = type
            }.store(in: &cancellables)
        input.selectCell
            .sink { [weak self] index in
                guard let self else { return }
                self.output.selectCellIndex = index
            }.store(in: &cancellables)
    }
    enum Action {
        case setDate(date: Date)
        case setType(type: SelectType)
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
