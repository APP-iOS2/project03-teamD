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
                ForEach(reportStore.reports) { report in
                    HStack {
                        Text("\(report.title)")
                        Spacer()
                        if report.isSelected {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.myMint)
                        }
                    }
                    .onTapGesture {
                        for (index, _) in reportStore.reports.enumerated() {
                            reportStore.reports[index].isSelected = false
                        }
                        
                        if let index = reportStore.reports.firstIndex(where: { $0.id == report.id }) {
                            reportStore.reports[index].isSelected = true
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
                    // TODO: 신고 처리 로직 구현하기
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
