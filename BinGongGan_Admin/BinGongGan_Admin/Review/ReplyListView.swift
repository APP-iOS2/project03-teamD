//
//  ReplyListView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct ReplyListView: View {
    @StateObject private var replyStore: ReplyStore = ReplyStore()
    
    var body: some View {
        List(replyStore.replyList) { reply in
            NavigationLink {
                ReplyDetailView(reply: reply)
            } label: {
                VStack(alignment: .leading) {
                    Text(reply.reply.content)
                        .font(.body1Bold)
                    Text(reply.review.content)
                        .padding()
                        .font(.body1Regular)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.myLightGray2)
                        )
                }
            }
        }
        .tint(.myMint)
        .navigationTitle("리뷰 답글")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .onAppear {
            Task {
                try await replyStore.fetchReply()
            }
        }
    }
}

struct ReplyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReplyListView()
        }
    }
}
