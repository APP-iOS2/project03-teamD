//
//  MySpaceCell.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI

struct MySpaceCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text("영석키친")
                    .font(.title)
                Text("오영석")
                Text("010-1234-1234")
                Text("서울특별시 강남구 논현로 30 뉴진스")
                
                CarouselCell()
                    .frame(width: 320, height: 160)
                    .cornerRadius(15)
            }
            .foregroundColor(.white)
            .bold()
        } //: HStack
        .padding(20)
        .background(Color.myPrimary)
        .cornerRadius(15)
        .padding([.leading, .trailing])
    }
}

struct MySpaceCell_Previews: PreviewProvider {
    static var previews: some View {
        MySpaceCell()
    }
}
