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
    
    func addReview(review: Review) async throws{
        myReviews.append(review)
        
        do {
            try await MyReviewStore.service.saveDocument(collectionId: .reviews, documentId: review.id, data: review)
        } catch {
            throw error
        }
    }
}
