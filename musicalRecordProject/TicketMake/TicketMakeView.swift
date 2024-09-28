//
//  TicketMakeView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/28/24.
//

import SwiftUI

struct TicketMakeView: View {
    @State private var mockUpActors = ["박성민": false, "임수민": false, "유진영": false, "김윤우": false,"휴": false, "잭": false]
    @State private var selectedActors: [Bool]
    @State private var isSelected = false
    @State private var rating = 0.0
    @State private var state = TicketState.completion
    @State private var reviewText = ""
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let inputBackColor = Color.grayBackground
    let inputHeight: CGFloat = 40
    let itemSpace: CGFloat = 20
    let colums = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    init() {
        _selectedActors = State(initialValue: Array(repeating: false, count: 6))
    }
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                postView()
                titleView()
                Spacer()
                    .frame(height: 20)
                inputView()
            }
            .frame(width: width)
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationTitle("티켓 만들기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Action
                    print("버튼 눌림")
                } label: {
                    Text("저장")
                }
            }
        }
    }
}

#Preview {
    TicketMakeView()
}

// MARK: - 상단 버튼 부분
private extension TicketMakeView {
    func postView() -> some View {
        VStack(alignment: .center) {
            Image.exPost
                .resizable()
                .frame(width: width * 0.4, height: width * 0.4 * 1.5)
            if state == .completion {
                RatingView(rating: $rating)
                    .frame(width: width * 0.1, height: 20)
                    .padding(.top, 10)
            }
        }
        
    }
    func inputView() -> some View {
        VStack(alignment: .leading) {
            Text("캐스팅")
                .font(.boldFont16)
                .padding(.leading, 5)
            LazyVGrid(columns: colums) {
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(inputBackColor)
                        .frame(height: inputHeight)
                        .frame(minWidth: 40, maxWidth: 90)
                        .overlay {
                            Text("박성민")
                        }
                }
                
            }
            Spacer()
                .frame(height: itemSpace)
            if state == .completion {
                Text("후기")
                    .font(.boldFont16)
                    .padding(.leading, 5)
                TextEditor(text: $reviewText)
                    .customStyleEditor(placeholder: "후기를 작성해주세요.", userInput: $reviewText)
                    .frame(height: 200)
                
                Spacer()
                    .frame(height: itemSpace)
            }
            Text("관람일자")
                .font(.boldFont16)
                .padding(.leading, 5)
            RoundedRectangle(cornerRadius: 15)
                .fill(inputBackColor)
                .frame(height: inputHeight)
                .overlay {
                    Text("2024.09.28")
                }
            Spacer()
                .frame(height: itemSpace)
            Text("공연장소")
                .font(.boldFont16)
                .padding(.leading, 5)
            RoundedRectangle(cornerRadius: 15)
                .fill(inputBackColor)
                .frame(height: inputHeight)
                .overlay {
                    Text("영등포역 어쩌구")
                }
            Spacer()
                .frame(height: itemSpace)
            Text("티켓가격")
                .font(.boldFont16)
                .padding(.leading, 5)
            RoundedRectangle(cornerRadius: 15)
                .fill(inputBackColor)
                .frame(height: inputHeight)
                .overlay {
                    Text("1000억원")
                }
            
        }
        .padding(.horizontal)
        .frame(width: width, alignment: .leading)
        
    }
    func titleView() -> some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.asMainColor)
                .frame(width: 50, height: 30)
                .overlay {
                    Text(state.title)
                        .font(.boldFont14)
                        .asForeground(Color.white)
                }
            Text("발구르는 봉팔이에 연극")
                .font(.boldFont17)
                .asForeground(.asFont)
        }
        .frame(width: width, alignment: .leading)
        .padding(.leading, 30)
        
        
    }
    func ButtonView(name: String) -> some View {
        
        Button {
            // Action
            isSelected.toggle()
        } label: {
            Text("Click Me")
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.purple : Color.white) // 선택되면 보라색, 그렇지 않으면 흰색
                .cornerRadius(20)
                .overlay(
                    Capsule() // 캡슐 모양
                        .stroke(isSelected ? Color.purple : Color.gray, lineWidth: 2)
                )
                .foregroundColor(isSelected ? .white : .black) // 글자색도 변경
        }
    }
}
