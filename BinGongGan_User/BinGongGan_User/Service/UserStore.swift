//
//  UserData.swift
//  BinGongGan_User
//
//  Created by 마경미 on 11.09.23.
//

import Foundation
import BinGongGanCore
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
    

    static func loadUserData(userId: String, user: User) async throws -> User {
        do {
            let user = try await service.loadDocument(collectionId: .users, documentId: userId, data: user)
            return user
        } catch {
            throw error
        }
    }

    static func updateUserData(user: User) async throws {
        guard let userId = user.id else { return }
        
        do {
            try await service.saveDocument(collectionId: .users, documentId: userId, data: user)
            print("updateUserData: 성공")
        } catch {
            throw error
        }
    }

    static func fetchUserData(userId: String) async throws -> Bool {
        do {
            let user : User? = try await service.fetchDocument(collectionId: .users, documentId: userId)
            guard let user = user else { return false }
            print(user)
            return true
        } catch {
            return false
        }
    }

//
//    static func updatePartOfUserData() {
//
//    }
//
//    static func removeUserData() {
//
//    }
}
