//
//  ReviewReportSheet.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/06.
//

import SwiftUI

struct ReviewReportSheet: View {
    @EnvironmentObject var reportStore: ReportStore
    
    @Binding var isShowingReviewReportSheet: Bool
    
    @State private var isShowingReportAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("이 리뷰에 대해 무엇을 신고하려고 하시나요?")
                Spacer()
            }
            .padding(20)
            
            List {
                ForEach(reportStore.reportCategory) { report in
                    HStack {
                        Text("\(report.reason)")
                        Spacer()
                        if report.isSelected {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.myMint)
                        }
                    }
                    .onTapGesture {
                        for (index, _) in reportStore.reportCategory.enumerated() {
                            reportStore.reportCategory[index].isSelected = false
                        }
                        
                        if let index = reportStore.reportCategory.firstIndex(where: { $0.id == report.id }) {
                            reportStore.reportCategory[index].isSelected = true
                        }
                    }
                }
            }
            .listStyle(.plain)
            
            Button(role: .destructive) {
                isShowingReportAlert.toggle()
            } label: {
                Text("신고 제출하기")
            }
        }
        .navigationTitle("리뷰 신고")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $isShowingReportAlert) {
            Alert(
                title: Text("리뷰 신고"),
                message: Text("해당 리뷰를 신고하시겠습니까?"),
                primaryButton: .cancel(Text("취소하기")),
                secondaryButton: .destructive(Text("신고하기"), action: {
                    for category in reportStore.reportCategory {
                        if category.isSelected {
                            let report = Report(
                                // TODO: 신고한 판매자 ID, 신고한 리뷰 ID 넣기
                                reporterId: "",
                                reportedReviewId: "",
                                reason: category.reason,
                                isSelected: category.isSelected
                            )
                            reportStore.reportReview(report: report)
                            break
                        }
                    }
                    
                    for (index, _) in reportStore.reportCategory.enumerated() {
                        reportStore.reportCategory[index].isSelected = false
                    }
                    
                    isShowingReviewReportSheet.toggle()
                })
            )
        }
    }
}

struct ReviewReportSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewReportSheet(isShowingReviewReportSheet: .constant(true))
                .environmentObject(ReportStore())
        }
    }
}
