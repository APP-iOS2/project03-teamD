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
    
    var body: some View {
        List {
            ForEach(1..<5, id: \.self) { review in
                Section {
                    MyReviewRowView(text: "리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.")
                }

            }
        }
        .navigationTitle("내가 작성한 리뷰")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MyReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyReviewListView()
        }
    }
}
