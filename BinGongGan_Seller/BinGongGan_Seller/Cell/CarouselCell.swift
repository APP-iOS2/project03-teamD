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
                AsyncImage(url: URL(string: "https://i.namu.wiki/i/7ty5kfzWYjaQZwEnu1mw1MHoMwlon4idv56VJE0B6LmJq6t8udR2H7oMvIovAN4EUXhZmXaKiHgz86ajNO8tNg.webp")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 370, height: 160)
                        .cornerRadius(15)
//                        .padding(.horizontal, 15)
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
        CarouselCell()
    }
}
