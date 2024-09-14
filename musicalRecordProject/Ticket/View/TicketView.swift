//
//  TicketView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/13/24.
//

import SwiftUI

struct TicketView: View {
    @Binding var isFlipped: Bool
    @Binding var widthSize: CGFloat
    @Binding var heightSize: CGFloat
    var body: some View {
        VStack {
            if isFlipped {
                backTicket(widthSize: widthSize, heightSize: heightSize)
            } else {
                frontTicket(widthSize: widthSize, heightSize: heightSize)
            }
        }
        .scaleEffect(x: isFlipped ? -1 : 1)
        .frame(width: 200, height: 300)
        .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: -1, z: 0))
        .animation(.easeInOut(duration: 0.6), value: isFlipped)
        .onTapGesture {
            isFlipped.toggle()
        }
        .frame(width: widthSize, height: heightSize)
    }
}


private extension TicketView {
    func frontTicket(widthSize: CGFloat, heightSize: CGFloat) -> some View {
        ZStack{
            Rectangle()
                .fill(.gray)
                .cornerRadius(10)
            
            HStack {
                Image("testImage")
                    .resizable()
                    .frame(width: widthSize / 3, height: heightSize, alignment: .leading)
                    .cornerRadius(10)
                
                
                VStack(alignment: .leading) {
                    Text("고구마와 친구들")
                        .frame(width: widthSize / 2,alignment: .leading)
                        .padding(.bottom, 5)
                    Text("댄, 휴, 잭, 성민, 수민")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("\"고구마를 먹다가 죽다.\"")
                        .padding(.bottom, 10)
                }
                .padding(.top, 10)
                Spacer()
            }
            
        }
        .overlay {
            Circle()
                .fill(.white)
                .offset(x: -widthSize * 1.75)
                .scaleEffect(0.3)
            Circle()
                .fill(.white)
                .offset(x: widthSize * 1.75)
                .scaleEffect(0.3)
            
            Circle()
                .fill(.white)
                .offset(x: -widthSize * 1.7, y: heightSize * 5)
                .scaleEffect(0.1)
            Circle()
                .fill(.white)
                .offset(x: -widthSize * 1.7, y: -heightSize * 5)
                .scaleEffect(0.1)
        }
        
        .frame(width: widthSize, height: heightSize)
    }
    func backTicket(widthSize: CGFloat, heightSize: CGFloat) -> some View {
        let qrSize: CGFloat = widthSize / 4
        return ZStack{
            Rectangle()
                .fill(.gray)
                .cornerRadius(10)
            HStack {
                VStack(alignment: .leading) {
                    Text("후기 작성")
                        .padding(.top)
                    Text("후기 작성합니다")
                    Spacer()
                }
                .padding(.leading, 15)
                Spacer()
                VStack {
                    Spacer()
                        .frame(height: 15)
                    Rectangle()
                        .frame(width: 2)
                    Spacer()
                        .frame(height: 15)
                }
                    
                VStack(spacing: 10) {
                    Image("QR")
                        .resizable()
                        .frame(width: qrSize,height: qrSize)
                    Text("202407542941")
                        .font(.caption)
                }
                .padding(.trailing, 15)
                .padding(.leading, 3)
                
                
                
            }
        }
        .overlay {
            Circle()
                .fill(.white)
                .offset(x: -widthSize * 1.75)
                .scaleEffect(0.3)
            Circle()
                .fill(.white)
                .offset(x: widthSize * 1.75)
                .scaleEffect(0.3)
            
            Circle()
                .fill(.white)
                .offset(x: widthSize * 1.7, y: heightSize * 5)
                .scaleEffect(0.1)
            Circle()
                .fill(.white)
                .offset(x: widthSize * 1.7, y: -heightSize * 5)
                .scaleEffect(0.1)
        }
        .frame(width: widthSize, height: heightSize)
    }
}
