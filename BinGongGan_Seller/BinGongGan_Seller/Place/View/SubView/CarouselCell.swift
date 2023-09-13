//
//  CarouselCell.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct CarouselCell: View {
    
    var room: Room
//    var urlStrings: [String] = [
//        "https://t2.daumcdn.net/thumb/R720x0.fpng/?fname=http://t1.daumcdn.net/brunch/service/user/6bWv/image/enpC-LVvOM4EI120_-QsMhntxUM.png",
//        "https://byline.network/wp-content/uploads/2020/01/kitchen1.jpg"
//    ]
    
    var body: some View {
        TabView {
            ForEach(room.imageNames, id: \.self) { urlString in
                AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 210)
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct CarouselCell_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCell(room: Room())
    }
}
