//
//  HomeEventTapView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum HomeEventTapConstant {
    static let frameHeight = CGFloat(120)
    static let framePadding = CGFloat(20)
}

struct HomeEventTapView: View {
    
    @ObservedObject var dummyStore: DummyStore = DummyStore()
    
    var body: some View {
        VStack {
            TabView{
                ForEach(dummyStore.EventDummys) { dummy in
                    dummy.eventImage
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width:.infinity, height: HomeEventTapConstant.frameHeight)
            .foregroundColor(.black)
            .background(.black)
        }// VStack
    }// Body
}

struct HomeEventTapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEventTapView()
    }
}
