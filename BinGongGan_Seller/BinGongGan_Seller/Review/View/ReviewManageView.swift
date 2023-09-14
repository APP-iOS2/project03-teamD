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
    @EnvironmentObject private var reviewStore: ReviewStore
    
    @StateObject var myPlaceStore: MyPlaceStore = MyPlaceStore()
    @StateObject var replyStore: ReplyStore = ReplyStore()
    @StateObject var reportStore: ReportStore = ReportStore()
    
    @State private var isLoading = true
    
    @State private var selectedPlace: String = ""
    
    var body: some View {
        Group {
            Form {
                if isLoading {
                    ProgressView()
                } else {
                    ForEach(reviewStore.roomList) { room in
                        Section {
                            ForEach(Array(reviewStore.reviewList.enumerated()), id: \.element.id) { index, review in
                                NavigationLink {
                                    ReviewManageDetailView(replyStore: replyStore, reportStore: reportStore, review: review)
                                        .environmentObject(reviewStore)
                                } label: {
                                    ReviewCell(review: review)
                                        .environmentObject(reviewStore)
                                        .environmentObject(replyStore)
                                        .environmentObject(reportStore)
                                }
                            }
                        } header: {
                            Text("\(room.name)")
                        }
                    }
                }
            }
            .background(Color.myBackground)
            .navigationTitle("리뷰 관리")
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .customBackbutton()
            
        }
        .onAppear {
            Task {
                await reviewStore.fetchData()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isLoading = false
            }
        }
    }
}
