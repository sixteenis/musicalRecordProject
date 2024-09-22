//
//  TicketStorageView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/14/24.
//

import SwiftUI

struct TicketStorageView: View {
    @State private var ticketWidth: CGFloat = 350
    @State private var ticketHeight: CGFloat = 150
    @State private var searchViewShow = false
    @State private var searchText = ""
    
    @StateObject private var vm = TicketStorageVM()
    
    var body: some View {
        NavigationView {
            VStack {
                CustomSegmentedControl(selected: $vm.output.selectPerformance, width: 300)
                    .onChange(of: vm.output.selectPerformance) { newValue in
                        vm.input.selectedPerformance.send(newValue)
                    }
                    
                if searchViewShow {
                    searchView()
                }
                ticketList()
            } //:VSTACK
            .navigationTitle("티켓보관함")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if searchViewShow {
                        Image.xMark
                            .foregroundColor(.logoColor)
                            .wrapToButton {
                                searchViewShow.toggle()
                                searchText = ""
                            }
                    } else {
                        Image.search
                            .foregroundColor(.logoColor)
                            .wrapToButton {
                                searchViewShow.toggle()
                            }
                    }
                }
//                ToolbarItem(placement: .topBarLeading) {
//                    Image.remove
//                }
            }
        } //:NAVIGATION
    }
}

// MARK: - 서치바
private extension TicketStorageView {
    func searchView() -> some View {
        VStack(spacing: 5) {
            TextField("공연 이름을 통해 검색하기", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 텍스트 필드 스타일
                .padding(.horizontal, 20)
            Divider()
        }
    }
}
// MARK: - 티켓 리스트 부분
private extension TicketStorageView {
    func ticketList() -> some View {
        ScrollView {
            LazyVStack {
                ForEach($vm.output.ticketList) { ticket in
                    TicketView(isFlipped: ticket.isBack, widthSize: $ticketWidth, heightSize: $ticketHeight)
                }
            }
        }
    }
}

#Preview {
    TicketStorageView()
}
