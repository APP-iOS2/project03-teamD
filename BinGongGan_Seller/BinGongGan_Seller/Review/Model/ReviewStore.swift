//
//  ReviewStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

final class ReviewStore: ObservableObject {
    @Published var roomList: [Room] = []
    @Published var reviewList: [Review] = []
    
    let sellerUid = AuthStore.userUid
    
    var dbRef = Firestore.firestore().collection("reviews")
    
    init() {
        Task {
            await fetchRoomList()
        }
    }
    
    @MainActor func fetchRoomList() async {
        do {
            let collectionRef = Firestore.firestore().collection("Room").whereField("placeId", isEqualTo: sellerUid)
            let snapshot = try await collectionRef.getDocuments()
            self.roomList = try snapshot.documents.compactMap {
                try $0.data(as: Room.self)
            }
        } catch {
            print("Error fetching room list")
        }
    }
    
    @MainActor func fetchData() async {
        do {
            let snapshot = try await dbRef.getDocuments()
            
            self.reviewList = try snapshot.documents.compactMap {
                try $0.data(as: Review.self)
            }
        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
}
