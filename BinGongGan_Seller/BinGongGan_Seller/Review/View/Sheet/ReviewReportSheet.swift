//
//  ReviewReportSheet.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct ReviewReportSheet: View {
    @EnvironmentObject var reportStore: ReportStore
    
    @Binding var isShowingReviewReportSheet: Bool
    
    @State private var isShowingReportAlert: Bool = false
    
    @State private var selectedCase: [Bool] = Array(repeating: false, count: ReportCase.allCases.count)
    
    var review: Review
    private var reviewId: String {
        if let reviewId = review.id {
            return reviewId
        }
        
        return ""
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("이 리뷰에 대해 무엇을 신고하려고 하시나요?")
                Spacer()
            }
            .padding(20)
            
            List {
                ForEach(Array(ReportCase.allCases.indices), id: \.self) { index in
                    HStack {
                        Text("\(ReportCase.allCases[index].rawValue)")
                        Spacer()
                        if selectedCase[index] {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.myMint)
                        }
                    }
                    .onTapGesture {
                        selectedCase = Array(repeating: false, count: ReportCase.allCases.count)
                        selectedCase[index] = true
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
                    guard let reviewId = review.id else { return }
                    for index in 0..<ReportCase.allCases.count {
                        if selectedCase[index] {
                            let report = Report(
                                reviewId: reviewId,
                                sellerId: AuthStore.userUid,
                                reason: ReportCase.allCases[index].rawValue)
                            
                            Task {
                                await reportStore.loadData(report: report)
                            }
                            break
                        }
                    }
                    
                    selectedCase = Array(repeating: false, count: ReportCase.allCases.count)
                    isShowingReviewReportSheet.toggle()
                })
            )
        }
    }
}

struct ReviewReportSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewReportSheet(
                isShowingReviewReportSheet: .constant(true),
                review:
                    Review(
                        placeId: "1B7F6970-EEC1-4244-8D4F-9F8F047F124F",
                        writerId: "xll3TbjPUUZOtWVQx2tsetWlvpV2",
                        date: "2023.09.12 화",
                        rating: 5,
                        content: "리뷰인데 아닌데? 아니긴 뭐가 아니야 맞으면서 넌 리뷰야 리뷰!"
                    )
            )
            .environmentObject(ReportStore())
        }
    }
}
