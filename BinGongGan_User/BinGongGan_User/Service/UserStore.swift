//
//  UserData.swift
//  BinGongGan_User
//
//  Created by 마경미 on 11.09.23.
//

import Foundation
import BinGongGanCore

public class UserStore {
    static let service = FirestoreService()

    static func saveUserData(user: User) async throws {
        guard let userId = user.id else {
            return
        }

        do {
            try await service.saveDocument(collectionId: .users, documentId: userId, data: user)
        } catch {
            throw error
        }
    }
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
