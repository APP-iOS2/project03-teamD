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
    @State var isLoading: Bool = true
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 0) {
                    ForEach(homeStore.EventList) { event in
                        AsyncImage(url: event.imageURL, content: { image in
                            image
                                .resizable()
                                .frame(width: HomeNameSpace.screenWidth )
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
        .redacted(reason: isLoading ? .placeholder : [])
        .onAppear {
           
                Task {
                    await homeStore.fetchPlaces()
                    self.isLoading = false
                }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(width: HomeNameSpace.screenWidth, height: HomeNameSpace.screenHeight * 0.5)
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
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    
                    Text("\(currentPage + 1)")
                        .font(.body1Bold)
                        .foregroundColor(.white)
                    Text("|  \(homeStore.EventList.count)")
                        .font(.body1Bold)
                        .foregroundColor(.white)
                    
                    Button {
                        if currentPage == homeStore.EventList.count - 1 {
                            currentPage = 0
                        } else {
                            currentPage += 1
                        }
                    } label: {
                        Text("+")
                            .font(.body1Bold)
                            .foregroundColor(.white)
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
