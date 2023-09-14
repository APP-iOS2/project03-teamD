//
//  ReportDetailView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/14.
//

import SwiftUI
import BinGongGanCore

struct ReportDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var reportStore: ReportStore
    var report: AdminReport
    
    var body: some View {
        Form {
            Section("신고 내용") {
                HStack {
                    Text("신고 유형")
                        .bold()
                    Spacer()
                    Text(report.report.reason)
                }
                VStack(alignment: .leading) {
                    Text("댓글 내용")
                        .bold()
                    Text(report.review.content)
                        .padding()
                        .font(.body1Regular)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.myLightGray2)
                        )
                }
            }
            Section("신고자") {
                HStack {
                    Text("이름(닉네임)")
                        .bold()
                    Spacer()
                    Text("\(report.seller.name) (\(report.seller.nickname))")
                }
                HStack {
                    Text("이메일")
                        .bold()
                    Spacer()
                    Text(report.seller.email)
                }
            }
            HStack {
                Button {
                    Task {
                        try await reportStore.removeReport(reportId: report.report.id)
                    }
                    dismiss()
                } label: {
                    Text("신고 취하")
                        .buttonStyle(backgroundColor: .gray)
                }
                
                Button {
                    Task {
                        try await reportStore.removeReview(reviewId:report.review.id ?? "")
                        try await reportStore.removeReport(reportId: report.report.id)
                    }
                    dismiss()
                } label: {
                    Text("댓글 삭제")
                        .buttonStyle(backgroundColor: .myBrown)
                }
            }
        }
        .navigationTitle("신고 내용")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct ReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReportDetailView(reportStore: ReportStore(), report: AdminReport(report:Report(reviewId: "aaa", sellerId: "ass`", reason: "불쾌한 표현") , review: Review(placeId: "dd", writerId: "ss", date: "ss", rating: 1, content: "zzfzfzfzffz"), seller: Seller(id: "dd", name: "판매자", birthDate: "dd", phoneNumber: "dd", email: "dd`", nickname: "dd", password: "email", bankName: "돈많은백수", accountNumber: "ㄴㄴ", registrationNum: "ㅁㅁㅁㅁ", registrationImage: "")))
        }
    }
}
