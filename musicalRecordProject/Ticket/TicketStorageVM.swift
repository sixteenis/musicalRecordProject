//
//  TicketStorageVM.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/22/24.
//

import Foundation
import Combine

final class TicketStorageVM: ViewModeltype {
    var cancellables = Set<AnyCancellable>()
    var input = Input()
    @Published var output = Output()
    struct Input {
        let selectedPerformance = PassthroughSubject<PerformancePicker, Never>()
        
    }
    struct Output {
        var selectPerformance = PerformancePicker.all
        var ticketList = [TicketModel(title: "1"), TicketModel(title: "2"), TicketModel(title: "3"), TicketModel(title: "4")]
    }
    init() {
        transform()
    }
    func transform() {
        input.selectedPerformance
            .sink { [weak self] type in
                guard let self else { return }
                self.output.selectPerformance = type
            }.store(in: &cancellables)
        
    }
    enum Action {
        
    }
    func action(_ action: Action) {
        
    }
    
    
}

