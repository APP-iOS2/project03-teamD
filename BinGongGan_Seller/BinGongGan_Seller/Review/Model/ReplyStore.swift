//
//  ReplyStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

final class ReplyStore: ObservableObject {
    @Published var replies: [Reply] = []
    
    var dbRef = Firestore.firestore().collection("Replies")
    
    init() {
        
    }
    
    @MainActor func fetchData(review: Review) async {
        replies = []
        
        do {
            let snapshot = try await dbRef.getDocuments()
            for document in snapshot.documents {
                if let replyData = document.data()["Replies"] as? [[String: Any]] {
                    for data in replyData {
                        if let id = data["id"] as? String,
                           let content = data["content"] as? String,
                           let date = data["date"] as? String {
                            let reply = Reply(id: id, content: content, date: date)
                            self.replies.append(reply)
                        }
                    }
                }
            }
            self.replies = self.replies.filter { $0.id == review.id }
        } catch {
            print("Error fetching replies: \(error)")
        }
        
        replies = replies.filter({ $0.id == review.id })
    }
    
    func uploadReply(newReply: Reply) {
        replies.append(newReply)
        
        Task {
            await loadData(reply: newReply)
        }
    }
    
    func loadData(reply: Reply) async {
        do {
            guard let reviewId = reply.id else { return }
            try await dbRef.document(reviewId)
                .setData(reply.asDictionary())
        } catch {
            print("Error loading replies: \(error)")
        }
    }
}
