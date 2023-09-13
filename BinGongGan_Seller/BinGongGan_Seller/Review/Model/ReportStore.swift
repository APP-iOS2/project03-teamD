//
//  ReportStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/10.
//

import Foundation
import FirebaseFirestore
import BinGongGanCore

final class ReportStore: ObservableObject {
    @Published var reportList: [Report] = []
    
    var dbRef = Firestore.firestore().collection("Reports")
    
    init() {
        
    }
    
    @MainActor func fetchData(review: Review) async {
        do {
            let snapshot = try await dbRef.getDocuments()
            self.reportList = try snapshot.documents.compactMap {
                try $0.data(as: Report.self)
            }
            self.reportList = self.reportList.filter({ $0.id == review.id })
        } catch {
            print("Error fetching reports: \(error)")
        }
    }
    
    func reportReview(report: Report) {
        reportList.append(report)
        
        Task {
            await loadData(report: report)
        }
    }
    
    func loadData(report: Report) async {
        do {
            guard let reportId = report.id else { return }
            try await dbRef.document(reportId).setData([
                "Reports": reportList.map { $0.asDictionary() }
            ])
        } catch {
            print("Error loading reports: \(error)")
        }
    }
}
