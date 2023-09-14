//
//  AnnouncementStore.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/14.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class AnnouncementStore: ObservableObject {
    @Published var systemAnnouncementList: [Announcement] = []
    private let dbRef = Firestore.firestore()
    
    func fetchAnnouncement() async throws {
        var tempList: [Announcement] = []
        
        do {
            let snapshot = try await dbRef.collection("announcement").getDocuments()
            let documents = snapshot.documents
            
            for document in documents {
                do {
                    let announcement = try document.data(as: Announcement.self)
                    tempList.append(announcement)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.systemAnnouncementList = tempList
        } catch {
            print("Error getting document: \(error)")
        }
    }
}
