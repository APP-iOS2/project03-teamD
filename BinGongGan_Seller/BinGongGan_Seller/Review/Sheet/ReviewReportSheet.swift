//
//  ReviewReportSheet.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/06.
//

import SwiftUI

struct ReviewReportSheet: View {
    @Binding var isShowingReviewReportSheet: Bool
    
    @State var isShowingReportAlert: Bool = false
    
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
            
            Button(role: .destructive) {
                // TODO: 신고 처리 로직 구현하기
            } label: {
                Text("신고 제출하기")
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("리뷰 신고")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ReviewReportSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewReportSheet(isShowingReviewReportSheet: .constant(true))
        }
    }
}
