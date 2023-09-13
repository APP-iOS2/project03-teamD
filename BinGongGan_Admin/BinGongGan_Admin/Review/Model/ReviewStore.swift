//
//  ReviewStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class ReviewStore: ObservableObject {
    @Published var reviewList: [AdminReview] = []
    private let dbRef = Firestore.firestore()
    
    init() {}
    
    func fetchReview() async throws {
        var tempList: [AdminReview] = []
        
        do {
            let snapshot = try await dbRef.collection(Collections.review.rawValue).getDocuments()
            let documents = snapshot.documents
            for document in documents {
                do {
                    let review = try document.data(as: Review.self)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.reviewList = tempList
        } catch {
            print("Error getting document: \(error)")
        }
    }
    
    //MARK: - 수정 필요
    func getWriterName(writerId: String) async throws -> String? {
        do {
            let writer = try await dbRef.collection("user").document(writerId).getDocument(as: User.self)
            return writer.name
        } catch {
            print("Error getting document: \(error)")
            return nil
        }
    }
}
