//
//  SettingView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/13/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let widthSize = geometry.size.width
                let heightSize = geometry.size.height
                backView(widthSize: widthSize, heightSize: heightSize)
                    .overlay {
                        VStack {
                            profileView()
                                .frame(width: widthSize * 0.8, height: heightSize * 0.15)
                            Spacer()
                                .frame(height: heightSize * 0.065)
                            lineView()
                            Spacer()
                                .frame(height: heightSize * 0.08)
                            ticketInforView()
                                .frame(width: widthSize * 0.7, height: heightSize * 0.17)
                            Spacer()
                            
                            profileSetUpButton()
                                .frame(width: widthSize * 0.7, height: heightSize * 0.07)
                            
                        }
                        .padding(30)
                        
                    }
                
            }
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
// MARK: - 프로필
private extension SettingView {
    func profileView() -> some View {
        HStack {
            VStack {
                HStack {
                    Text("닉네임")
                    Spacer()
                }
                Spacer()
                    .frame(height: 15)
                HStack {
                    Text("ddd")
                    Spacer()
                }
            }
            Spacer()
            Image(systemName: "star")
        }
    }
    func lineView() -> some View {
        Line()
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
            .frame(height: 1)
            .padding(.horizontal, 20)
    }
    struct Line: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            return path
        }
    }
}
// MARK: - 현재 기록 상황 뷰
private extension SettingView {
    func ticketInforView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue)
            HStack(spacing: 30) {
                inforView()
                inforLine()
                inforView()
                inforLine()
                inforView()
            }
        }
    }
    func inforView() -> some View {
        //기록된 티켓, 예정된 티켓, 좋아요 리스트
        VStack {
            Text("티켓")
            Image(systemName: "star")
            Text("33")
        }
    }
    func inforLine() -> some View {
        Rectangle()
            .frame(width: 1)
            .background(Color.white)
            .padding([.top,.bottom], 25)
        
    }
}
private extension SettingView {
    func profileSetUpButton() -> some View {
        Button {
            // Action
            print("수정버튼 클릭")
        } label: {
        
                
                RoundedRectangle(cornerRadius: 30)
                .overlay {
                    Text("프로필 수정하기")
                        .foregroundStyle(.white)
                }
                
            
            
            
        }
    }
}
// MARK: - 배경
private extension SettingView {
    func backView(widthSize: CGFloat, heightSize: CGFloat) -> some View {
        Rectangle()
            .padding([.horizontal, .top], 20)
            .foregroundColor(.gray)
            .overlay {
                Circle()
                    .fill(.white)
                    .offset(x: -widthSize * 2.5, y: -heightSize * 1.2)
                    .scaleEffect(0.2)
                Circle()
                    .fill(.white)
                    .offset(x: widthSize * 2.5, y: -heightSize * 1.2)
                    .scaleEffect(0.2)
                Circle()
                    .fill(.white)
                    .offset(y: -heightSize * 2.4)
                    .scaleEffect(0.2)
                
            }
    }
    
}
#Preview {
    SettingView()
}
