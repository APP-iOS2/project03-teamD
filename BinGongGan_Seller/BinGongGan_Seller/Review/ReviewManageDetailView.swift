//
//  ReviewManageDetailView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI

struct ReviewManageDetailView: View {
    @State var isShowingReviewReportSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            VStack {
                ScrollView {
                    ReservationCell()
                    
                    ReviewWithCommentCell()
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                }
                
                Button("리뷰 신고하기", role: .destructive) {
                    isShowingReviewReportSheet.toggle()
                }
            }
            .navigationTitle("리뷰 상세")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $isShowingReviewReportSheet) {
            ReviewReportSheet(isShowingReviewReportSheet: $isShowingReviewReportSheet)
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
