//
//  TabView.swift
//  BinGongGan_Admin
//
//  Created by 최하늘 on 2023/09/06.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationSplitView {
            CategoryView()
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
