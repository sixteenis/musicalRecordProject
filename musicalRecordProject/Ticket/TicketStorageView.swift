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
    @State private var removeButtonTap = false
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
                    if removeButtonTap {
                        Text("완료")
                            .asForeground(Color.asFont)
                            .wrapToButton {
                                removeButtonTap.toggle()
                            }
                    } else {
                        Text("편집")
                            .asForeground(Color.asFont)
                            .wrapToButton {
                                removeButtonTap.toggle()
                            }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    if searchViewShow {
                        Image.xMark
                            .foregroundColor(.logoColor)
                            .wrapToButton {
                                searchViewShow.toggle()
                                vm.input.searchText.send("")
                            }
                    } else {
                        Image.search
                            .foregroundColor(.logoColor)
                            .wrapToButton {
                                searchViewShow.toggle()
                            }
                    }
                }
                
                
            }
            .onAppear {
                vm.input.viewAppear.send(())
            }
            .alert("삭제하기", isPresented: $vm.output.removeAlert) {
                Button("취소", role: .cancel) {
                    // nothing needed here
                }
                Button("삭제하기", role: .destructive) {
                    self.vm.input.RealRemoveTicket.send(())
                }
            } message: {
                Text("삭제 시 복구 불가능합니다.")
            }
        } //:NAVIGATION
    }
}

// MARK: - 서치바
private extension TicketStorageView {
    func searchView() -> some View {
        VStack(spacing: 5) {
            TextField("공연 이름을 통해 검색하기", text: $vm.output.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 텍스트 필드 스타일
                .padding(.horizontal, 20)
                .onChange(of: vm.output.searchText) {
                    self.vm.input.searchText.send($0)
                }
            Divider()
        }
    }
}
// MARK: - 티켓 리스트 부분
private extension TicketStorageView {
    func ticketList() -> some View {
        ScrollView {
            LazyVStack {
                ForEach($vm.output.ticketList, id: \.imageRoute) { ticket in
                    TicketView(tikcet: ticket, widthSize: $ticketWidth, heightSize: $ticketHeight, removeState: $removeButtonTap) {
                        self.vm.input.removeTicket.send(ticket.wrappedValue)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    TicketStorageView()
}
