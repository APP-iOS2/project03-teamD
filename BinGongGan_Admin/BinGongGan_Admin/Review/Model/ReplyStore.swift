//
//  ReplyStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/14.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class ReplyStore: ObservableObject {
    @Published var replyList: [AdminReply] = []
    private let dbRef = Firestore.firestore()
    
    func fetchReply() async throws {
        var tempList: [AdminReply] = []
        
        do {
            let snapshot = try await dbRef.collection("Replies").getDocuments()
            let documents = snapshot.documents
            for document in documents {
                do {
                    let reply = try document.data(as: Reply.self)
                    guard let reviewId = reply.id else { return }
                    let review = try await dbRef.collection(Collections.review.rawValue).document(reviewId).getDocument().data(as: Review.self)
                    let writer = try await dbRef.collection(Collections.user.rawValue).document(review.writerId).getDocument().data(as: User.self)
                    let place = try await dbRef.collection(Collections.place.rawValue).document(review.placeId).getDocument().data(as: Place.self)
                    let newReply = AdminReply(reply: reply, review: review, place: place, writer: writer)
                    
                    tempList.append(newReply)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.replyList = tempList
        } catch {
            print("Error getting document: \(error)")
        }
    }
}
