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
    
    // 자동 id 데이터 저장
    func saveDocument<T: Codable>(collectionId: Collections, data: T) async throws {
        do {
            try dbRef.collection(collectionId.rawValue).addDocument(from: data.self)
            print("Success to save new document at collection\(collectionId.rawValue)")
        } catch {
            print("Error to save new document : \(error)")
            throw error
        }
    }
    
    // id 지정 데이터저장
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
            return try snapshot.data(as: T.self)
            
        } catch {
            return nil
        }
    }
    
    func searchDocumentWithEqualField<T: Codable>(collectionId: Collections, field: String, compareWith: Any) async throws -> [T]? {
        do {
            let querySnapshot = try await dbRef.collection(collectionId.rawValue).whereField(field, isEqualTo: compareWith).getDocuments()
            
            if querySnapshot.documents.isEmpty {
                print("At \(collectionId.rawValue) document is Empty")
                return nil
            } else {
                var result: [T] = []
                for document in querySnapshot.documents {
                    let temp = try await document.data(as: T.self)
                    result.append(temp)
                }
                return result
            }
        } catch {
            print("Error to search document at \(collectionId.rawValue) with Field \(field) : \(error)")
            throw error
        }
    }
}
