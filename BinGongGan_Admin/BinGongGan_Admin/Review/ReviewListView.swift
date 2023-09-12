//
//  ReviewListView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct ReviewListView: View {
    @StateObject private var reviewStore: ReviewStore = ReviewStore()
    @State private var writerName: String = ""
    var body: some View {
        List(reviewStore.reviewList) { review in
            NavigationLink {
                
            } label: {
                HStack {
                    Text(review.content)
                }
            }
        }
        .onAppear {
            Task {
                try await reviewStore.fetchReview()
            }
        }
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewListView()
        }
    }
}
