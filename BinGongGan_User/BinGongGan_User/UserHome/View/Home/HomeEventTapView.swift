//
//  HomeEventTapView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

enum HomeEventTapConstant {
    static let eventListHeight = CGFloat(120)
}

struct HomeEventTapView: View {
    
    @ObservedObject var dummyStore: HomeStore = HomeStore()
    private let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            TabView{
                ForEach(dummyStore.EventList) { dummy in
                    AsyncImage(url: dummy.imageURL, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }) {
                        ProgressView()
                    }
                        
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width:screenWidth, height: HomeEventTapConstant.eventListHeight)
            .foregroundColor(.black)
            .background(Color.myPrimary)
//
        }// VStack
    }// Body
}

struct HomeEventTapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEventTapView()
    }
}
