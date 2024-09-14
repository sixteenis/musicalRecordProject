//
//  TicketStorageView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/14/24.
//

import SwiftUI

struct TicketStorageView: View {
    @State private var isFlipped = false
    @State private var ticketWidth: CGFloat = 350
    @State private var ticketHeight: CGFloat = 150

    @State private var selectPerformance = PerformancePicker.all
    
    let picker = PerformancePicker.allCases
    var body: some View {
        VStack {
            CustomSegmentedControl(selected: $selectPerformance, width: 300)
            Spacer()
            TicketView(isFlipped: $isFlipped, widthSize: $ticketWidth, heightSize: $ticketHeight)
        }
    }
    func menuView() -> some View {
        Text("123")
    }
}


#Preview {
    TicketStorageView()
}
