//
//  ReportStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/10.
//

import Foundation
import FirebaseFirestore
import BinGongGanCore

struct Report: Identifiable, Codable {
    var id: String = UUID().uuidString
    
    var reporterId: String = "" // 신고한 판매자 ID
    var reportedReviewId: String = "" // 신고한 리뷰 ID
    var reason: String // 신고 사유
    var isSelected: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case reporterId
        case reportedReviewId
        case reason
        case isSelected
    }
}

final class ReportStore: ObservableObject {
    @Published var reportList: [Report] = []
    @Published var reportCategory: [Report] = []
    
    var dbRef = Firestore.firestore().collection("reports")
    
    init() {
        Task {
            await fetchData()
        }
        
        reportCategory = [
            Report(reason: ReportCase.unrelated.rawValue, isSelected: false),
            Report(reason: ReportCase.spamFlagging.rawValue, isSelected: false),
            Report(reason: ReportCase.obscenity.rawValue, isSelected: false),
            Report(reason: ReportCase.offensiveLanguage.rawValue, isSelected: false),
            Report(reason: ReportCase.etc.rawValue, isSelected: false)
        ]
    }
    
    @MainActor func fetchData() async {
        do {
            let snapshot = try await dbRef.getDocuments()
            self.reportList = try snapshot.documents.compactMap {
                try $0.data(as: Report.self)
            }
        } catch {
            print("Error fetching reports: \(error)")
        }
    }
    
    func reportReview(report: Report) {
        reportList.append(report)
        
        Task {
            await loadData()
        }
    }
    
    func loadData() async {
        do {
            // TODO: document 이름 신고된 리뷰 ID로 수정하기
            try await dbRef.document("reportedReviewID").setData([
                "reports": reportList.map { $0.asDictionary() }
            ])
        } catch {
            print("Error loading reports: \(error)")
        }
    }
}
