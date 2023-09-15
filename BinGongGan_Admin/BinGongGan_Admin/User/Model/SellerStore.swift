//
//  SellerStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class SellerStore: ObservableObject {
    @Published var sellerList: [Seller] = []
    private let dbRef = Firestore.firestore()
    
    init() {}
    
    func fetchSeller() async throws {
        var tempList: [Seller] = []
        
        do {
            let snapshot = try await dbRef.collection(Collections.seller.rawValue).getDocuments()
            let documents = snapshot.documents
            
            for document in documents {
                do {
                    let seller = try document.data(as: Seller.self)
                    tempList.append(seller)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.sellerList = tempList
        } catch {
            print("Error getting document: \(error)")
        }
    }
    
    func removeSeller(sellerId: String) async throws{
        try await dbRef.collection(Collections.seller.rawValue).document(sellerId).delete()
        try await fetchSeller()
    }
}
