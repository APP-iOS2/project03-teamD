//
//  DetailSegmentReviewListView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/11.
//

import SwiftUI

struct DetailSegmentReviewListView: View {
    @EnvironmentObject var gongGan: GongGanStore
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(gongGan.reviews) { review in
                    DetailReviewRowView(review: review)
                }
            }
            .padding(.bottom, 50)
        }
        .padding()
    }
}



struct DetailSegmentReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSegmentReviewListView()
            .environmentObject(GongGanStore())
    }
}
