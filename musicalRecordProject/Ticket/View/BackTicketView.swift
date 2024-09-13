//
//  BackTicketView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/14/24.
//

import SwiftUI

struct BackTicketView: View {
    let widthSize: CGFloat
    let heightSize: CGFloat
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.gray)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("후기 작성")
                Text("후기 작성합니다")
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

#Preview {
    BackTicketView(widthSize: 350, heightSize: 150)
}
