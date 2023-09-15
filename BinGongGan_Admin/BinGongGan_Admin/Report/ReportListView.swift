//
//  ReportListView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct ReportListView: View {
    @StateObject private var reportStore: ReportStore = ReportStore()
    
    var body: some View {
        List(reportStore.reportList) { report in
            NavigationLink {
                ReportDetailView(reportStore: reportStore, report: report)
            } label: {
                VStack(alignment: .leading) {
                    Text(report.report.reason)
                    Text(report.review.content)
                        .padding()
                        .font(.body1Regular)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.myLightGray2)
                        )
                }
            }
        }
        .tint(.myMint)
        .onAppear {
            Task {
                try await reportStore.fetchReport()
            }
        }
        .navigationTitle("신고된 리뷰")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct ReportListView_Previews: PreviewProvider {
    static var previews: some View {
        ReportListView()
    }
}
