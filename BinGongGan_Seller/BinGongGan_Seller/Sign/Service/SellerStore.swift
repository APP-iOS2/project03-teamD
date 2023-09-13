//
//  UserStore.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import SwiftUI

 final class SellerStore {
   
    static let service = FirestoreService()

    static func saveUserData(seller: Seller) async throws {
        do {
            try await service.saveDocument(collectionId: .sellers, documentId: seller.id, data: seller)
        } catch {
            throw error
        }
    }
    
    static func fetchUserData(sellerId: String) async throws -> Bool {
        do {
            let seller : Seller? = try await service.fetchDocument(collectionId: .sellers, documentId: sellerId)
            guard let seller = seller else { return false }
            print(seller)
            return true
        } catch {
            return false
        }
    }
    
    //*/
    //
    //    static func updateUserData(user: User) {
    //
    //    }
    //
    //    static func updatePartOfUserData() {
    //
    //    }
    //
    //    static func removeUserData() {
    //
    //    }
    
}
