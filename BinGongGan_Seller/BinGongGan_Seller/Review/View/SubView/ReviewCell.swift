//
//  ReviewCell.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReviewCell: View {
    var review: Review
    
    var body: some View {
        VStack {
            HStack {
                Text("\(review.placeId)")
                    .fontWeight(.bold)
                Spacer()
                Text("\(review.date)")
            }
            
            HStack {
                ForEach(1...5, id: \.self) { star in
                    Image(systemName: "star.fill")
                        .foregroundColor(star < review.rating ? .yellow : .gray)
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("\(review.content)")
                Spacer()
            }
        }
        .padding()
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(15)
    }
}

struct ReviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCell(review:
                    Review(
                        placeId: "1B7F6970-EEC1-4244-8D4F-9F8F047F124F",
                        writerId: "xll3TbjPUUZOtWVQx2tsetWlvpV2",
                        date: "2023.09.12 화",
                        rating: 5,
                        content: "리뷰인데 아닌데? 아니긴 뭐가 아니야 맞으면서 넌 리뷰야 리뷰!"
                    )
        )
    }
}
