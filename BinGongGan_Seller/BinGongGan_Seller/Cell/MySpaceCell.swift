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
                    HStack {
                        Text("영석키친")
                            .font(.head1Bold)
                        Text("#132")
                            .font(.head1Bold)
                    }
                    Text("서울특별시 강남구 논현로 30 뉴진스")
                    Text("12000원 / 시간당")
                    HStack {
                        Spacer()
                        Text("총 예약 수 200. 리뷰 99. 찜 10")
                    }
                VStack {
                    CarouselCell()
                }
            }
        } //: HStack
        .padding(20)
        .background(Color.white)
        .cornerRadius(15)
        .padding([.leading, .trailing])
    }
}

struct MySpaceCell_Previews: PreviewProvider {
    static var previews: some View {
        MySpaceCell()
    }
}
