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
    case place = "Place"
    case room = "Room"
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
}
