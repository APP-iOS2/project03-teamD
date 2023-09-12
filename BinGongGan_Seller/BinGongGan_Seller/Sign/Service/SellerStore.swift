//
//  SellerStore.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/12.
//

import Foundation
import BinGongGanCore

 class SellerStore {
    static let service = FirestoreService()
///*
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

