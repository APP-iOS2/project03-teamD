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
        guard let sellerId = seller.id else {
            return
        }
        
        do {
            try await service.saveDocument(collectionId: .sellers, documentId: sellerId, data: seller)
        } catch {
            throw error
        }
    }
    
    // 이메일이 있으면 false, 없으면 true 반환
    static func checkDuplicateEmail(email: String) async throws -> Bool {
        do {
            guard let _: [Seller] = try await service.searchDocumentWithEqualField(collectionId: .sellers, field: "email", compareWith: email) else {
                return false
            }
            return true
        }
    }
    
    static func fetchUserData() async throws -> Seller? {
        do {
            let seller: Seller? = try await service.fetchDocument(collectionId: .sellers, documentId: AuthStore.userUid)
            return seller
        } catch {
            return nil
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
