//
//  TabView.swift
//  BinGongGan_Admin
//
//  Created by 최하늘 on 2023/09/06.
//

import SwiftUI

struct MainTabView: View {
    @State var splitViewVisibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $splitViewVisibility) {
            CategoryView()
        } content: {
            MainEmptyView()
        } detail: {
            MainEmptyView()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
