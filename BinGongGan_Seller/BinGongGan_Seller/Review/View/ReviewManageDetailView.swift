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
    
    @StateObject var reportStore: ReportStore = ReportStore()
    
    @State var isShowingReviewReportSheet: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                    ReservationCell()
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    
                    ReviewWithCommentCell()
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
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
            ReviewReportSheet(isShowingReviewReportSheet: $isShowingReviewReportSheet)
                .environmentObject(reportStore)
                .presentationDetents([.medium, .large])
        }
    }
}

struct ReviewManageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewManageDetailView()
        }
    }
}
