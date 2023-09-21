//
//  ReportStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/14.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class ReportStore: ObservableObject {
    @Published var reportList: [AdminReport] = []
    private let dbRef = Firestore.firestore()
    
    func fetchReport() async throws {
        var tempList: [AdminReport] = []
        
        do {
            let snapshot = try await dbRef.collection("Reports").getDocuments()
            let documents = snapshot.documents
            for document in documents {
                do {
                    let report = try document.data(as: Report.self)
                    let review = try await
                    dbRef.collection(Collections.review.rawValue).document(report.reviewId).getDocument().data(as: Review.self)
                    let seller = try await dbRef.collection(Collections.seller.rawValue).document(report.sellerId).getDocument().data(as: Seller.self)
                  
                    let newReport = AdminReport(report: report, review: review, seller: seller)
                    
                    tempList.append(newReport)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.reportList = tempList
        } catch {
            print("Error getting document: \(error)")
        }
    }
    
    func removeReport(reportId: String) async throws{
        try await dbRef.collection("Reports").document(reportId).delete()
        try await fetchReport()
    }
    
    func removeReview(reviewId: String, reportId: String) async throws{
        try await dbRef.collection(Collections.review.rawValue).document(reviewId).delete()
        try await dbRef.collection("Reports").document(reportId).delete()
        try await fetchReport()
    }
}

