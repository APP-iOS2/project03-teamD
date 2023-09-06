//
//  CarouselCell.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/06.
//

import SwiftUI

struct CarouselCell: View {
    var body: some View {
        TabView {
            ForEach(1...3, id: \.self) { _ in
                Image("image1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 200)
                    .cornerRadius(15)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .padding(.horizontal, 15)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct CarouselCell_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCell()
    }
}
