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
    
    @State private var currentPage: Int = 0
    @State private var num: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 0) {
                    ForEach(dummyStore.EventList) { dummy in
                        AsyncImage(url: dummy.imageURL, content: { image in
                            image
                                .resizable()
                                .frame(width: screenWidth)
                        }) {
                            ProgressView()
                        }
                    }
                }
            }// ScrollView
            .content.offset(x: CGFloat(currentPage) * -geometry.size.width)
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                    num += 1
                    if num == 2 {
                        withAnimation {
                            currentPage = (currentPage + 1) % dummyStore.EventList.count
                        }
                        num = 0
                    }
                }
                RunLoop.current.add(timer, forMode: .common)
            }
        }// GeometryReader
        .tabViewStyle(PageTabViewStyle())
        .frame(width: screenWidth, height: HomeEventTapConstant.eventListHeight)
        .foregroundColor(.black)
        .background(Color.myPrimary)
    }// Body
}

struct HomeEventTapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEventTapView()
    }
}
