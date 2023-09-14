//
//  UserStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class UserStore: ObservableObject {
    @Published var userList: [User] = []
    private let dbRef = Firestore.firestore()
    
    init() {}
    
    func fetchUser() async throws {
        var tempList: [User] = []
        
        do {
            let snapshot = try await dbRef.collection(Collections.user.rawValue).getDocuments()
            let documents = snapshot.documents
            
            for document in documents {
                do {
                    let user = try document.data(as: User.self)
                    tempList.append(user)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.userList = tempList
        } catch {
            print("Error getting document: \(error)")
        }
    }
}
