//
//  SwiftUIView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI

struct DetailTabImageView: View {
    
    @State var imageUrl: [String]
    @State private var selectedTab = 0
    private let screenWidth = UIScreen.main.bounds.width
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
        DetailTabImageView(imageUrl: ["https://firebasestorage.googleapis.com/v0/b/bingongganapp.appspot.com/o/reviews%2F63554850-92B7-4D40-A1C1-E1FC10C06DDC%2F63554850-92B7-4D40-A1C1-E1FC10C06DDC0?alt=media&token=cde2a0a7-0642-4eb9-9ff7-de5202aa970a"])
    }
}
