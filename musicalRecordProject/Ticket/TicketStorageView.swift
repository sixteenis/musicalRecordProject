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
    @State private var searchViewShow = false
    @State private var searchText = ""
    
    let picker = PerformancePicker.allCases
    let testList = [1,2,3,4,5,6,7,8]
    var body: some View {
        NavigationView {
            VStack {
                CustomSegmentedControl(selected: $selectPerformance, width: 300)
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
                ForEach(testList, id: \.self) { _ in
                    TicketView(isFlipped: $isFlipped, widthSize: $ticketWidth, heightSize: $ticketHeight)
                }
            }
        }
    }
}

#Preview {
    TicketStorageView()
}
