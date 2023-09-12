//
//  SwiftUIView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI

struct DetailTabImageView: View {
    @State var imageUrl: [String]
    private let screenWidth = UIScreen.main.bounds.width
    @State private var selectedTab = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            
            TabView {
                ForEach(imageUrl.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: imageUrl[index])) { image in
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
            
        }
    }
}

struct DetailTabImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTabImageView(imageUrl: [""])
    }
}
