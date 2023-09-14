//
//  PostingStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class PostingStore: ObservableObject {
    @Published var postingList: [AdminPoting] = []
    private let dbRef = Firestore.firestore()
    
    func fetchPosting() async throws {
        var tempList: [AdminPoting] = []
        
        do {
            let snapshot = try await dbRef.collection(Collections.place.rawValue).getDocuments()
            let documents = snapshot.documents
            for document in documents {
                do {
                    let place = try document.data(as: Place.self)
                    let seller = try await dbRef.collection(Collections.seller.rawValue).document(place.sellerId).getDocument().data(as: Seller.self)
                    let roomSnapshot = try await dbRef.collection(Collections.room.rawValue).whereField("placeId", isEqualTo: place.id).getDocuments()
   
                    let roomDocuments = roomSnapshot.documents
                    var roomList:[Room] = []
                    for roomDocument in roomDocuments {
                        do {
                            let room = try roomDocument.data(as: Room.self)
                            roomList.append(room)
                        }catch let err {
                            print("error : \(err)")
                        }
                    }
                    let newPosting = AdminPoting(place: place, seller: seller, rooms: roomList)
                    tempList.append(newPosting)
                    
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.postingList = tempList
        } catch {
            print("Error getting document: \(error)")
        }
    }
    
    func removePosting(placeId: String) async throws{
        try await dbRef.collection(Collections.place.rawValue).document(placeId).delete()
        try await fetchPosting()
    }
}
