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
    
    var dbRef = Firestore.firestore().collection("reply")
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    @MainActor func fetchData() async {
        do {
            let snapshot = try await dbRef.getDocuments()
            
            self.replies = try snapshot.documents.compactMap {
                try $0.data(as: Reply.self)
            }
        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
    
    func uploadReply(newReply: Reply) {
        replies.append(newReply)
    }
}
