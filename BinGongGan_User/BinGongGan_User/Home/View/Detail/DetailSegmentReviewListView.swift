//
//  DetailSegmentReviewListView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/11.
//

import SwiftUI

struct DetailSegmentReviewListView: View {
    @EnvironmentObject var gongGan: GongGanStore
    @State var placeId: String
    
    var body: some View {
        NavigationStack {
            VStack {
                if !gongGan.reviews.isEmpty {
                    ForEach(gongGan.reviews) { review in
                        DetailReviewRowView(review: review)
                    }
                } else {
                    Text("등록된 리뷰가 없습니다.")
                }
            }
            .padding(.bottom, 50)
        }
        .padding()
        .onAppear{
            Task {
                await gongGan.fetchReViews(placeId: placeId)
            }
        }
    }
}



struct DetailSegmentReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSegmentReviewListView(placeId: "")
            .environmentObject(GongGanStore())
    }
}
