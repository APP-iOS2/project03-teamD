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
                HStack(spacing: 10) {
                    ForEach(homeStore.EventList) { event in
                        AsyncImage(url: event.imageURL, content: { image in
                            image
                                .resizable()
                                .frame(width: HomeNameSpace.screenWidth - 10)
                                .clipped()
                        }) {
                            ProgressView()
                                .frame(width: HomeNameSpace.screenWidth)
                        }
                    }
                }
            }// ScrollView
            .content.offset(x: CGFloat(currentPage) * -geometry.size.width - 10)
            .onReceive(timer) { _ in
                // Automatically switch to the next tab
                withAnimation {
                    currentPage = (currentPage + 1) % homeStore.EventList.count
                }
            }
        }// GeometryReader
        .tabViewStyle(PageTabViewStyle())
        .frame(width: HomeNameSpace.screenWidth, height: HomeNameSpace.screenHeight * 0.3)
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                Rectangle()
                    .frame(width: HomeNameSpace.screenWidth * 0.3, height: HomeNameSpace.screenHeight * 0.07)
                .opacity(0.7)
                .cornerRadius(3, corners: .topLeft)
                HStack {
                    Button {
                        if currentPage == 0 {
                            currentPage = homeStore.EventList.count - 1
                        } else {
                            currentPage -= 1
                        }
                    } label: {
                        Text("-")
                            .font(.body1Bold)
                            .foregroundColor(.myWhite)
                    }
                    .padding(.trailing, 10)
                    
                    Text("\(currentPage + 1)")
                        .font(.body1Bold)
                        .foregroundColor(.myWhite)
                    Text("|  \(homeStore.EventList.count)")
                        .font(.body1Bold)
                        .foregroundColor(.myWhite)
                    
                    Button {
                        if currentPage == homeStore.EventList.count - 1 {
                            currentPage = 0
                        } else {
                            currentPage += 1
                        }
                    } label: {
                        Text("+")
                            .font(.body1Bold)
                            .foregroundColor(.myWhite)
                    }
                    .padding(.leading, 10)
                    
                }// HSTACK
            }// ZSTACK
        }
        
    }// Body
}

struct HomeEventTapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEventTapView()
            .environmentObject(HomeStore())
    }
}
