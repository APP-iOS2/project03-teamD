//
//  DetailSegmentReviewListView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/11.
//

import SwiftUI

struct DetailSegmentReviewListView: View {
    let tempText: [String] = ["맛있어요", "맛있어요맛있어요", "맛있어요맛있어요맛있어요맛있어요맛있어요", "맛있어요맛있어요맛있어요맛있어요맛있어요"]
    
    var body: some View {
        NavigationStack {
            ForEach(Array(tempText.enumerated()), id: \.element) { (index, element) in
                DetailReviewRowView(text: element)
            }
        }
    }
}



struct DetailSegmentReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSegmentReviewListView()
    }
}
