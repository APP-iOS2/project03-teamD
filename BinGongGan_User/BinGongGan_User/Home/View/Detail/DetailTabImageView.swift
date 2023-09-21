//
//  SwiftUIView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI

struct DetailTabImageView: View {
    @Binding var imageUrl: [String]
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
        DetailTabImageView(imageUrl: .constant( ["https://firebasestorage.googleapis.com:443/v0/b/bingongganapp.appspot.com/o/place%2F785TxPRCwAgeXG3NzHojdWyMGOs2%2FE6FCC596-0915-4492-A5A8-1A0A1244E140.jpeg?alt=media&token=eddd8978-434d-4156-882c-936d333271f8","https://firebasestorage.googleapis.com:443/v0/b/bingongganapp.appspot.com/o/place%2F785TxPRCwAgeXG3NzHojdWyMGOs2%2FE6FCC596-0915-4492-A5A8-1A0A1244E140.jpeg?alt=media&token=eddd8978-434d-4156-882c-936d333271f8"]))
    }
}
