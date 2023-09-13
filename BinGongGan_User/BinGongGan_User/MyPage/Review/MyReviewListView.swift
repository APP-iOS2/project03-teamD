//
//  MyReviewListView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyReviewListView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var myReviewStore: MyReviewStore
    var body: some View {
        List {
            NavigationLink {
                AddReviewView()
            } label: {
                Text("임시 리뷰 추가 버튼")
            }

            ForEach(myReviewStore.myReviews) { review in
                MyReviewRowView(review: review)
                    .listRowBackground(Color.myBackground)
                    .padding(.vertical, 15)
                    .listSectionSeparator(.hidden, edges: .top)
            }
        }
        .navigationTitle("내가 작성한 리뷰")
        .listStyle(.plain)
        .customBackbutton()
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .navigationBarBackButtonHidden(true)
    }
}

struct MyReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyReviewListView()
                .navigationBarTitleDisplayMode(.inline)
                .environmentObject(MyReviewStore())
        }
    }
}
