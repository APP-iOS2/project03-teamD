//
//  FirestoreService.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import BinGongGanCore
import Foundation
import FirebaseFirestore

enum Collections: String {
    case announcement = "announcement"
    case user = "users"
    case review = "reviews"
    case seller = "sellers"
//    case report = "Reprots"
}

class FirestoreService {
    private let dbRef = Firestore.firestore()
    
    func saveDocument<T: Codable>(collectionId: Collections, data: T) async throws {
        do {
            try dbRef.collection(collectionId.rawValue).addDocument(from: data.self)
            print("Success to save new document at collection\(collectionId.rawValue)")
        } catch {
            print("Error to save new document : \(error)")
            throw error
        }
    }
    
    func saveDocument<T: Codable>(collectionId: Collections, documentId: String,
                                  data: T) async throws {
        do {
            try dbRef.collection(collectionId.rawValue).document(documentId).setData(from: data.self)
            print("Success to save new document at \(collectionId.rawValue) \(documentId)")
        } catch {
            print("Error to save new document at \(collectionId.rawValue) \(documentId) \(error)")
            throw error
        }
    }
    
    func fetchDocument<T: Codable>(collectionId: Collections, documentId: String) async throws -> T? {
        do {
            let snapshot = try await dbRef.collection(collectionId.rawValue).document(documentId).getDocument()
            switch collectionId {
            case .user:
                return try snapshot.data(as: User.self) as? T
            case .review:
                return try snapshot.data(as: Review.self) as? T
            case .announcement:
                return try snapshot.data(as: SystemAnnouncement.self) as? T
            case .seller:
                return try snapshot.data(as: Seller.self) as? T
//            case .report:
//                return try snapshot.data(as: Report.self) as? T
            }
        } catch {
            return nil
        }
    }
}
