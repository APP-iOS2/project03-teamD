//
//  ReviewListView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct ReviewListView: View {
    @StateObject private var reviewStore: ReviewStore = ReviewStore()
    
    var body: some View {
        List(reviewStore.reviewList) { review in
            NavigationLink {
                ReviewDetailView(review: review)
            } label: {
                VStack(alignment: .leading) {
                    Text(review.review.content)
                    Text("작성자: \(review.writer.name)")
                        .foregroundColor(.myDarkGray)
                }
            }
        }
        .onAppear {
            Task {
                try await reviewStore.fetchReview()
            }
        }
        .tint(.myMint)
        .navigationTitle("리뷰")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewListView()
        }
    }
}
