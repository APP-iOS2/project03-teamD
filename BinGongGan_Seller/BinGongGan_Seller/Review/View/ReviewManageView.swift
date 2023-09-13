//
//  ReviewManageView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReviewManageView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var reviewStore: ReviewStore = ReviewStore()
    @StateObject var replyStore: ReplyStore = ReplyStore()
    @StateObject var reportStore: ReportStore = ReportStore()
    
    @State private var isLoading = true
    
    @State private var selectedPlace: String = ""
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView()
            } else {
                Form {
                    Section {
                        ForEach(reviewStore.reviewList) { review in
                            NavigationLink {
                                ReviewManageDetailView(review: review)
                                    .environmentObject(reviewStore)
                                    .environmentObject(replyStore)
                                    .environmentObject(reportStore)
                            } label: {
                                ReviewCell(review: review)
                            }
                        }
                    } header: {
                        Text("공간 1")
                    }
                }
                .background(Color.myBackground)
                .navigationTitle("리뷰 관리")
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
                .customBackbutton()
            }
        }
        .onAppear {
            Task {
                await reviewStore.fetchData()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
}

struct ReviewManageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewManageView()
        }
    }
}
