//
//  musicalRecordProjectApp.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/12/24.
//

import SwiftUI

@main
struct musicalRecordProjectApp: App {
    init() {
            let appearance = UINavigationBarAppearance()
            
            // 뒤로 가기 버튼의 텍스트 제거
            appearance.setBackIndicatorImage(UIImage(systemName: "chevron.left"), transitionMaskImage: UIImage(systemName: "chevron.left"))
            appearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: -1000, vertical: 0) // 텍스트 위치를 화면 밖으로 밀어내기
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
            // 전체 내비게이션 바 스타일 설정
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
//            UINavigationBar.appearance().tintColor = .font // 아이콘 색상 설정
        }
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .accentColor(.asBlack)

        }
    }
}
