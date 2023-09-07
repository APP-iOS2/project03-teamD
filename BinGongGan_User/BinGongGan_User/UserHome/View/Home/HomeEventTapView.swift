//
//  HomeEventTapView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct HomeEventTapView: View {
    
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    @EnvironmentObject var homeStore: HomeStore
    @State private var currentPage: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 0) {
                    ForEach(homeStore.EventList) { dummy in
                        AsyncImage(url: dummy.imageURL, content: { image in
                            image
                                .resizable()
                                .frame(width: HomeNameSpace.screenWidth)
                                .clipped()
                        }) {
                            ProgressView()
                                .frame(width: HomeNameSpace.screenWidth)
                        }
                    }
                }
            }// ScrollView
            .content.offset(x: CGFloat(currentPage) * -geometry.size.width)
            .onReceive(timer) { _ in
                // Automatically switch to the next tab
                withAnimation {
                    currentPage = (currentPage + 1) % homeStore.EventList.count
                }
            }
        }// GeometryReader
        .tabViewStyle(PageTabViewStyle())
        .frame(width: HomeNameSpace.screenWidth, height: HomeNameSpace.screenHeight * 0.3)
        .foregroundColor(.black)
        
    }// Body
}

struct HomeEventTapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEventTapView()
            .environmentObject(HomeStore())
    }
}
