//
//  PostingListView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct PostingListView: View {
    @StateObject private var postingStore: PostingStore = PostingStore()
    
    var body: some View {
        List(postingStore.postingList) { posting in
            NavigationLink {
                PostingDetailView(postingStore: PostingStore(), posting: posting)
            } label: {
                VStack(alignment: .leading) {
                    Text(posting.place.placeName)
                    Text(posting.seller.name)
                        .foregroundColor(.myDarkGray)
                }
            }
        }
        .tint(.myMint)
        .onAppear {
            Task {
                try await postingStore.fetchPosting()
            }
        }
        .navigationTitle("공간 게시물")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct PostingListView_Previews: PreviewProvider {
    static var previews: some View {
        PostingListView()
    }
}
