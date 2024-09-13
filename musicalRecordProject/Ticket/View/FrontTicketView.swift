//
//  FrontTicketView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/14/24.
//

import SwiftUI

struct FrontTicketView: View {
    let widthSize: CGFloat
    let heightSize: CGFloat
    var body: some View {
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
}

#Preview {
    FrontTicketView(widthSize: 350, heightSize: 150)
}
