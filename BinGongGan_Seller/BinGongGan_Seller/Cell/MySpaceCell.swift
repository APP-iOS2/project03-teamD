//
//  MySpaceCell.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI

struct MySpaceCell: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("영석키친")
                        .font(.head1Bold)
                    Text("#132")
                        .font(.head1Bold)
                    Spacer()
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text("서울특별시 강남구 논현로 30 뉴진스")
                    Spacer()
                }
                
                HStack {
                    Text("12000원 / 시간당")
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("총 예약 수 200 리뷰 99 찜 10")
                }
                .padding(.top, 10)
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            
            Spacer()
            
            CarouselCell()
                .frame(height: 210)
        }
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct MySpaceCell_Previews: PreviewProvider {
    static var previews: some View {
        MySpaceCell()
    }
}
