//
//  UserStore.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/12.
//

import Foundation
import BinGongGanCore

 final class SellerStore {
    static let service = FirestoreService()
///*
    static func saveUserData(seller: Seller) async throws {

        do {
            try await service.saveDocument(collectionId: .sellers, documentId: seller.id, data: seller)
        } catch {
            throw error
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

