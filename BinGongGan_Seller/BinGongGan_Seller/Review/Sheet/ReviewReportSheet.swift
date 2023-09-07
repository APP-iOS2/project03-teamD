//
//  ReviewReportSheet.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/06.
//

import SwiftUI

struct ReviewReportSheet: View {
    @Binding var isShowingReviewReportSheet: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("이 리뷰에 대해 무엇을 신고하려고 하시나요?")
                Spacer()
            }
            .padding(20)
            
            List {
                ForEach(ReportCase.allCases, id: \.self) { reportCase in
                    Text("\(reportCase.rawValue)")
                    
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("리뷰 신고")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("닫기", role: .cancel) {
                    isShowingReviewReportSheet.toggle()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("신고", role: .destructive) {
                    // TODO: 신고 처리하는 로직 작성하기
                    isShowingReviewReportSheet.toggle()
                }
            }
        }
    }
}

struct ReviewReportSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewReportSheet(isShowingReviewReportSheet: .constant(true))
        }
    }
}
