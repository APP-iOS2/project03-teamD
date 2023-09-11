//
//  Base.swift
//  BinGongGan_User
//
//  Created by 마경미 on 11.09.23.
//

import Foundation
import FirebaseFirestore

public class FirestoreService {
    private let dbRef = Firestore.firestore()

    func saveDocument<T: Codable>(collectionId: Collections, data: T) async throws {
        do {
            try await dbRef.collection(collectionId.rawValue).addDocument(from: data.self)
            print("Success to save new document at collection\(collectionId.rawValue)")
        } catch {
            print("Error to save new document : \(error)")
            throw error
        }
    }
    
    func saveDocument<T: Codable>(collectionId: Collections, documentId: String,
        data: T) async throws {
        do {
            try await dbRef.collection(collectionId.rawValue).document(documentId).setData(from: data.self)
            print("Success to save new document at \(collectionId.rawValue) \(documentId)")
        } catch {
            print("Error to save new document at \(collectionId.rawValue) \(documentId) \(error)")
            throw error
        }
    }
}
