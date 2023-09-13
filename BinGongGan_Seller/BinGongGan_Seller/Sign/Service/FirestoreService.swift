//
//  FirestoreService.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

public class FirestoreService {
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
    
    func fetchDocument(collectionId: Collections, documentId: String) async throws -> Any? {
        do {
            let snapshot = try await dbRef.collection(collectionId.rawValue).document(documentId).getDocument()
            switch collectionId {
            case .users:
                return try snapshot.data(as: User.self)
            case .sellers:
                return try snapshot.data(as: Seller.self)
            case .place:
                return try snapshot.data(as: Place.self)
            case .room:
                return try snapshot.data(as: Room.self)
            }
        } catch {
            return nil
        }
    }
}
