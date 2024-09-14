//
//  TabBarView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/13/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "star")
                }
            TicketStorageView()
                .tabItem {
                    Image(systemName: "heart")
                }
            SettingView()
                .tabItem {  
                    Image(systemName: "heart.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
