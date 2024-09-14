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
    @State var list = [0,1,2,3,4,5,6,7,8,9,10]
    @State var selectedCell: Int? = 0
    @State var isCalendarVisible: Bool = true
    @State var moveDetailView = false
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                cellList()
                
            } //:VSTACK
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    SelectListView(selected: $selectedType)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image.search
                }
                ToolbarItem(placement: .principal) {
                    // 캘린더가 보이지 않으면 네비게이션에 표시
                    if !isCalendarVisible {
                        Text(selectedDate.formatted())
                    }
                }
            }
        } //:NAVIGATION
        
    }
}

#Preview {
    MainView()
}

private extension MainView {
    //캘린더 스크롤 로직
    func calendarViewWithGeometry() -> some View {
        // GeometryReader로 HorizontalCalendarView의 위치를 추적
        GeometryReader { geo in
            HorizontalCalendarView(selectedDate: $selectedDate)
                .onChange(of: geo.frame(in: .global).minY) { _ in
                    // 새로운 구문으로 변경 - 두 개의 매개변수가 없음
                    let newValue = geo.frame(in: .global).minY
                    if newValue < 0 {
                        withAnimation {
                            isCalendarVisible = false // 캘린더가 화면에서 사라짐
                        }
                    } else {
                        withAnimation {
                            isCalendarVisible = true // 캘린더가 화면에 보임
                        }
                    }
                }
        }
        .frame(height: 100) // CalendarView 높이를 고정 (적절한 높이로 설정)
    }
    func cellList() -> some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                calendarViewWithGeometry()
                ForEach(list, id: \.self) { id in
                    
                    cell(for: id)
                        .id(id)
                        .onTapGesture {
                            withAnimation {
                                
                                selectedCell = id
                                
                            }
                        }
                }
            }  //:VSTACK
        }  //:SCROLL
        
    }
    func cell(for id: Int) -> some View {
        HStack {
            VStack(spacing:0) {
                Spacer()
                    .frame(height: 6)
                Circle()
                    .fill(selectedCell == id ? .purple : .black)
                    .frame(width: 15)
                //.padding(.top, 10)
                Spacer()
                    .frame(height: 6)
                Rectangle()
                    .fill(.black)
                    .frame(width: 2)
                    .frame(maxHeight: .infinity)
            }
            if selectedCell == id {
                detailView()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                    .padding([.bottom,.top], 10)
                
            } else {
                defaultView()
                    .transition(AnyTransition.scale.animation(.bouncy))
                    .padding([.bottom,.top], 5)
            }
            
            
        }
        .frame(height: selectedCell == id ? 280 : 120)
        .padding(.horizontal, 10)
        //.padding(.bottom, 5)
        .animation(.easeInOut, value: selectedCell) // 애니메이션 추가
    }
    // MARK: - 미선택한 뷰
    func defaultView() -> some View {
        HStack {
            VStack {
                Text("3/17(수) ~ 03/28(일)")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .font(.subheadline)
                    .foregroundColor(Color.asSubFont)
                    .padding([.bottom,.top], 10)
                Text("너와 함께한 시간 속에서")
                    .bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .font(.body)
                Text("냠냠냠")
                    .frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
            }
            .padding(.leading)
            VStack {
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 100,height: 100, alignment: .top)
                    .background(Color.blue)
                    .padding(.top, 40)
                    .padding(.trailing)
                Spacer()
            }
        }
        
        
        
        
    }
    // MARK: - 선택한 경우 뷰
    func detailView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.asMainColor)
            VStack(spacing: 0) {
                defaultView()
                    .frame(height: 85)
                actorProfileView()
                actorProfileView()
                actorProfileView()
                actorProfileView()
                //detailButton()
                detailButton()
                    .padding(.top)
                //                    .frame(height: 44)
                //                    .frame(maxWidth: .infinity)
                
                Spacer()
            }
        }
        
    }
    func actorProfileView() -> some View {
        HStack {
            Text("출연진: 김부연, 임정균")
                .font(.callout)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
    }
    func detailButton() -> some View {
        NavigationLink(destination: TextView(int: list[selectedCell!])) {
            Text("자세히 보기 >")
                .font(.caption)
                .padding()
                .background(Color.background)
                .foregroundColor(.asMainColor)
                .cornerRadius(10)
                .padding()
        }
        //        NavigationLink(destination: TextView(), isActive: $moveDetailView) {
        //            let _ = print(list[selectedCell!])
        
        
        //        }
        
    }
}

struct DetailButton: View {
    var body: some View {
        Button(action: {
            // 여기에 디테일 뷰로 push하는 로직을 추가합니다.
        }) {
            HStack {
                Text("자세히 보기")
                    .foregroundColor(Color.purple)
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.purple)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.purple, lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

//        ZStack {
//            RoundedRectangle(cornerRadius: 30)
//                .fill(Color.asMainColor)
//                .opacity(0.5)
//            //                .overlay(
//            HStack {
//                VStack {
//                    Text("3/17(수) ~ 03/28(일)")
//                        .frame(maxWidth: .infinity,alignment: .leading)
//                        .font(.subheadline)
//                        .foregroundColor(Color.asSubFont)
//                        .padding([.bottom,.top], 10)
//                    Text("너와 함께한 시간 속에서")
//                        .bold()
//                        .frame(maxWidth: .infinity,alignment: .leading)
//                        .font(.body)
//                    Text("냠냠asdasd냠")
//                        .frame(maxWidth: .infinity,alignment: .leading)
//                    Spacer()
//                }
//                .padding(.leading)
//                VStack {
//                    Image(systemName: "star")
//                        .resizable()
//                        .frame(width: 100,height: 100, alignment: .top)
//                        .background(Color.blue)
//                        .padding([.top,.trailing], 15)
//                    Spacer()
//                }
//
//            }
//
//
//            //  )
//
//        } //:ZSTACK
