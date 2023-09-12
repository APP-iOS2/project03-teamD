//
//  MyReviewStore.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class MyReviewStore: ObservableObject {
    @Published var myReviews: [Review] = []
    
    static let service = FirestoreService()
    private let dbRef = Firestore.firestore()
    
    init(){
        Task {
            try await fetchReviews()
        }
    }

    
    @MainActor
    func addReview(review: Review) async throws{
        guard let reviewId: String = review.id else { return }
        do {
            try await MyReviewStore.service.saveDocument(collectionId: .reviews, documentId: reviewId, data: review)
            myReviews.append(review)
        } catch {
            throw error
        }
    }

    @MainActor
    func fetchReviews() async throws {
        //TODO: - User 로그인, 예약 내역 연결 후 해당 유저 및 공간 판매자 정보 가져와 보여줄 수 있도록 수정하기
        var tempList: [Review] = []
        let query = dbRef.collection(Collections.reviews.rawValue).whereField("writerId", isEqualTo: "xll3TbjPUUZOtWVQx2tsetWlvpV2")
        
        do {
            let snapshot = try await query.getDocuments()
            let documents = snapshot.documents
            
            for document in documents {
                do {
                    let review = try document.data(as: Review.self)
                    tempList.append(review)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.myReviews = tempList
            
        } catch {
            print("Error getting document: \(error)")
        }
    }
    
    @MainActor
    func findReply(reviewId: String?) async throws -> Reply?{
        guard let id = reviewId else { return nil }
        do {
            let reply = try await dbRef.collection("reply").document(id).getDocument(as: Reply.self)
            
            return reply
        } catch {
            print("Error getting document: \(error)")
        }
        return nil
    }
    
    func currentDateToString() -> String {
        let currentDate:Date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd EEE"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: currentDate)
    }
    
}
