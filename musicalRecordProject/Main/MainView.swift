//
//  MainView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/12/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedDate: Date = Date()
    @State var selectedType: SelectType = .performance
    @State var list = [1,2,3,4,5,6,7,8,9,10]
    @State var selectedCell: Int? = nil
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                HorizontalCalendarView(selectedDate: $selectedDate)
                cellList()
            } //:VSTACK
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    SelectListView(selected: $selectedType)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                }
            }
        } //:NAVIGATION
        
    }
}

#Preview {
    MainView()
}
private extension MainView {
    func cellList() -> some View {
        
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(list, id: \.self) { id in
                        cell(for: id)
                            .id(id)
                            .onTapGesture {
                                withAnimation {
                                    if selectedCell == id {
                                        selectedCell = nil
                                    } else {
                                        selectedCell = id
                                    }
                                }
                            }
                    }
                }  //:VSTACK
                
            }  //:SCROLL
            
        }//reder
    }
    func cell(for id: Int) -> some View {
        HStack {
            VStack(spacing:0) {
                Circle()
                    .fill(selectedCell == id ? .purple : .black)
                    .frame(width: 15)
                Spacer()
                    .frame(height: 5)
                Rectangle()
                    .fill(.black)
                    .frame(width: 2)
                    .frame(maxHeight: .infinity)
            }
            defaultView()
            
        }
        .frame(height: selectedCell == id ? 300 : 150)
        .padding(.horizontal, 10)
        .animation(.easeInOut, value: selectedCell) // 애니메이션 추가
    }
    func defaultView() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.background)
                .overlay(
                    HStack {
                        VStack {
                            Text("3/17(수) ~ 03/28(일)")
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .font(.subheadline)
                                .foregroundColor(Color.asSubFont)
                                .padding(.bottom, 10)
                            Text("너와 함께한 시간 속에서")
                                .bold()
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .font(.body)
                            Text("냠냠냠")
                            Spacer()
                        }
                        .padding(.leading)
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 100,height: 100, alignment: .topTrailing)
                            .background(Color.blue)
                    }
                    
                    
                )
            
        } //:ZSTACK
    }
}
