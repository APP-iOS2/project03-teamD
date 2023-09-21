//
//  ReportDetailView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/14.
//

import SwiftUI
import BinGongGanCore

struct ReportDetailView: View {
    enum AlertType {
        case cancel
        case remove
    }
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var reportStore: ReportStore
    @State var isShowingAlert: Bool = false
    @State var alertType: AlertType = .cancel
    var report: AdminReport
    var alertMessage: String {
        switch alertType {
        case .cancel:
            return "허위 신고로 판정되어 신고를 취하시킵니다."
        case .remove:
            return "부적절한 댓글로 판단되어 해당 댓글을 삭제합니다."
        }
    }
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
                    alertType = .cancel
                    isShowingAlert.toggle()
                } label: {
                    Text("신고 취하")
                        .buttonStyle(backgroundColor: .gray)
                }
                
                Button {
                    alertType = .remove
                    isShowingAlert.toggle()
                } label: {
                    Text("댓글 삭제")
                        .buttonStyle(backgroundColor: .myBrown)
                }
            }
            .listRowBackground(Color.myBackground)
            .buttonStyle(.plain)
        }
        .navigationTitle("신고 내용")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .alert("신고 처리", isPresented: $isShowingAlert) {
            Button("취소", role: .none) {}
            Button("확인", role: .none) {
                    Task {
                        switch alertType {
                        case .cancel:
                            try await reportStore.removeReport(reportId: report.report.id)
                        case .remove:
                            try await reportStore.removeReview(reviewId:report.review.id ?? "", reportId: report.report.id)
                        }
                        dismiss()
                    }
                dismiss()
            }
        }message: {
            Text(alertMessage)
        }
    }
}

struct ReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReportDetailView(reportStore: ReportStore(), report: AdminReport(report:Report(reviewId: "aaa", sellerId: "ass`", reason: "불쾌한 표현") , review: Review(placeId: "dd", writerId: "ss", date: "ss", rating: 1, content: "zzfzfzfzffz"), seller: Seller(id: "dd", name: "판매자", birthDate: "dd", phoneNumber: "dd", email: "dd`", nickname: "dd", password: "email", bankName: "돈많은백수", accountNumber: "ㄴㄴ", registrationNum: "ㅁㅁㅁㅁ", registrationImage: "")))
        }
    }
}
