//
//  MyReviewStore.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/12.
//

import Foundation
import BinGongGanCore

class MyReviewStore: ObservableObject {
    static let service = FirestoreService()
    @Published var myReviews: [Review] = []
    
    init(){}
    
    @MainActor
    func addReview(review: Review) async throws{
        do {
            try await MyReviewStore.service.saveDocument(collectionId: .reviews, documentId: review.id, data: review)
            myReviews.append(review)
        } catch {
            throw error
        }
    }
    
    func currentDateToString() -> String {
        let currentDate:Date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd EEE"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: currentDate)
    }
}
