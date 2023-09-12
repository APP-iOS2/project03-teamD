//
//  AnnouncementStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class AnnouncementStore: ObservableObject {
    @Published var announcementList: [SystemAnnouncement] = []
    static let service = FirestoreService()
    private let dbRef = Firestore.firestore()
    
    init() {}
    
    func fetchAnnouncement() async throws {
        var tempList: [SystemAnnouncement] = []
        
        do {
            let snapshot = try await dbRef.collection(Collections.announcement.rawValue).getDocuments()
            let documents = snapshot.documents
            
            for document in documents {
                do {
                    let announcement = try document.data(as: SystemAnnouncement.self)
                    tempList.append(announcement)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.announcementList = tempList
        } catch {
            print("Error getting document: \(error)")
        }
    }
    
    func addAnnouncement(title: String, content: String, type: AnnouncementType) async throws{
        let id = UUID().uuidString
        let date = self.currentDateToString()
        
        let newAnnouncement = SystemAnnouncement(id: id, title: title, content: content, announcementType: type, createdAt: date)
        do {
            try await AnnouncementStore.service.saveDocument(collectionId: .announcement, documentId: id, data: newAnnouncement)
            announcementList.append(newAnnouncement)
        } catch {
            throw error
        }
    }
    
    func currentDateToString() -> String {
        let currentDate:Date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd EEE"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: currentDate)
    }
}
