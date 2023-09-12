//
//  AnnouncementStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation

@MainActor
class AnnouncementStore: ObservableObject {
    @Published var announcementList: [SystemAnnouncement] = []
    static let service = FirestoreService()
    
    init() {}

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
