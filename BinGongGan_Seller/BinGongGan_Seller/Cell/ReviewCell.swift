//
//  ReviewCell.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI

struct ReviewCell: View {
    var body: some View {
        VStack {
            HStack {
                Text("공간 이름")
                    .fontWeight(.bold)
                Spacer()
                Text("9/1 작성")
            }
            
            HStack {
                ForEach(1...5, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Text("리뷰 내용")
                Spacer()
            }
        }
        .background(.white)
        .foregroundColor(.black)
        .padding()
    }
}

struct ReviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCell()
    }
}
