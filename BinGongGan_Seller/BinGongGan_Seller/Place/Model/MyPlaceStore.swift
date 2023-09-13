//
//  MyPlaceStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/13.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

final class MyPlaceStore: ObservableObject {
    @Published var seller: Seller?
    @Published var rooms: [Room] = []
    
    let sellerUid = AuthStore.userUid
    
    init() {
        Task {
            await fetchSellerData()
        }
    }
    
    @MainActor func fetchSellerData() async {
        do {
            let docRef = Firestore.firestore().collection("sellers").document(sellerUid)
            let docSnapshot = try await docRef.getDocument()
            
            if docSnapshot.exists {
                let data = try docSnapshot.data(as: Seller.self)
                seller = data
            }
        } catch {
            print("Error fetching seller data")
        }
    }
}
