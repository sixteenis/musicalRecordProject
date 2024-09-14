//
//  SettingView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/13/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
         Text("asd")
    }
}
private extension SettingView {
    func backView(widthSize: CGFloat, heightSize: CGFloat) -> some View {
        Rectangle()
            .padding([.horizontal, .top], 20)
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

    }
}

#Preview {
    SettingView()
}
