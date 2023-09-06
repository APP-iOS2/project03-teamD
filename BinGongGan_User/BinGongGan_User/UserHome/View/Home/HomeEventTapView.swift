//
//  HomeEventTapView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum HomeEventTapConstant {
    static let eventListHeight = CGFloat(100)
}

struct HomeEventTapView: View {
    
    @ObservedObject var dummyStore: DummyStore = DummyStore()
    
    var body: some View {
        VStack {
            TabView{
                ForEach(dummyStore.EventList) { dummy in
                    dummy.eventImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width:.infinity, height: HomeEventTapConstant.eventListHeight)
            .foregroundColor(.black)
            .background(TestColor.brown)
//
        }// VStack
    }// Body
}

struct HomeEventTapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEventTapView()
    }
}
