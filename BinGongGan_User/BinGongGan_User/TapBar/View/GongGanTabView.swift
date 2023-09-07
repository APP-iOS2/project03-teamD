//
//  GongGanTabView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI

struct GongGanTabView: View {
    
    @StateObject var homeStore: HomeStore = HomeStore()
    @State private var selectedTab = 0
    @State var tabBarVisivility: Visibility = .visible
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView(tabBarVisivility: $tabBarVisivility)
                    .environmentObject(homeStore)
            }
            .tabItem {
                Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                    .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                Text("홈")
            }
            .tag(0)
            
            NavigationStack {
                HomeSearchView()
                    .environmentObject(homeStore)
            }
            .tabItem {
                Image(systemName: selectedTab == 1 ? "location.circle.fill" : "location.circle")
                    .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                Text("검색")
            }
            .tag(1)
            
            FavoriteView()
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                    Text("찜")
                }
                .tag(2)
            
            NavigationStack {
                MyPageMainView()
            }
            .tabItem {
                Image(systemName: selectedTab == 3 ? "book.fill" : "book")
                    .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                Text("마이페이지")
            }
            .tag(3)
        }
        .tint(.myPrimary)
        .navigationBarBackButtonHidden()
    }
}

struct GongGanTabView_Previews: PreviewProvider {
    static var previews: some View {
        GongGanTabView()
    }
}
