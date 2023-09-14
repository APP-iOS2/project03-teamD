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

    // 이메일이 있으면 false, 없으면 true 반환
    static func checkDuplicateEmail(email: String) async throws -> Bool {
        do {
            guard let _: [User] = try await service.searchDocumentWithEqualField(collectionId: .users, field: "email", compareWith: email) else {
                return false
            }
            return true
        }
    }

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
    

    static func loadUserData(userId: String, user: User) async throws -> User? {
        if userId.isEmpty {
            return nil
        }
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
    static func removeUserData(userId: String) async throws {
        do {
            try await service.deleteDocument(collectionId: .users, documentId: userId)
        } catch {
            throw error
        }
    }
}
