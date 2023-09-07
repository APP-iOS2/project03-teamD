//
//  SwiftUIView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI

struct DetailTabImageView: View {
    @StateObject var gongGan: GongGanStore = GongGanStore()
    private let screenWidth = UIScreen.main.bounds.width
    @State private var selectedTab = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            
            TabView {
                ForEach(gongGan.tempImage.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: gongGan.tempImage[index])) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width: screenWidth, height: 200)
            
            
//                TabView(selection: $selectedTab) {
//                    ForEach(gongGan.tempImage.indices, id: \.self) { index in
//                        AsyncImage(url: URL(string: gongGan.tempImage[index])) { image in
//                            image
//                                .resizable()
//                                .scaledToFill()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .tag(index) // Tag each tab with its index
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle())
//                .frame(width: screenWidth, height: 250)
//                .onReceive(timer) { _ in
//                    // Automatically switch to the next tab
//                    withAnimation {
//                        selectedTab = (selectedTab + 1) % gongGan.tempImage.count
//                    }
//                }
            
            
            
        }
    }
}

struct DetailTabImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTabImageView()
    }
}
