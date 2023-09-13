//
//  ReviewManageDetailView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReviewManageDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var reviewStore: ReviewStore
    var replyStore: ReplyStore
    var reportStore: ReportStore
    
    @State var isShowingReviewReportSheet: Bool = false
    
    var review: Review
    
    var body: some View {
        VStack {
            ScrollView {
                //                    ReservationCell(isHiddenRightButton: false)
                //                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                
                ReviewWithCommentCell(review: review)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .environmentObject(replyStore)
            }
            
            Button("리뷰 신고하기", role: .destructive) {
                isShowingReviewReportSheet.toggle()
            }
        }
        .background(Color.myBackground)
        .navigationTitle("리뷰 상세")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .customBackbutton()
        .sheet(isPresented: $isShowingReviewReportSheet) {
            ReviewReportSheet(
                isShowingReviewReportSheet: $isShowingReviewReportSheet,
                review: review
            )
            .environmentObject(reportStore)
            .presentationDetents([.medium, .large])
        }
        .onAppear {
            Task {
                await replyStore.fetchData(review: review)
            }
        }
    }
}

struct ReviewManageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewManageDetailView(replyStore: ReplyStore(), reportStore: ReportStore(), review: Review(
                placeId: "1B7F6970-EEC1-4244-8D4F-9F8F047F124F",
                writerId: "xll3TbjPUUZOtWVQx2tsetWlvpV2",
                date: "2023.09.12 화",
                rating: 5,
                content: "리뷰인데 아닌데? 아니긴 뭐가 아니야 맞으면서 넌 리뷰야 리뷰!"
            )
            )
            .environmentObject(ReviewStore())
            .environmentObject(ReplyStore())
            .environmentObject(ReportStore())
        }
    }
}
