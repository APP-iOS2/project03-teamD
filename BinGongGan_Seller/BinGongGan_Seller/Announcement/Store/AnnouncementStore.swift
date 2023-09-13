//
//  AnnouncementStore.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/12.
//

import BinGongGanCore
import FirebaseFirestore
import SwiftUI

class AnnouncementStore: ObservableObject {
    @Published var roomInfoList: [RoomAnnouncement] = []
    @Published var announcementList: [RoomAnnouncement] = []
    let sellerUid = AuthStore.userUid
    let dataBase = Firestore.firestore()
    
    func formattedDate(from date: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd"
        return dateFormatter.string(from: Date(timeIntervalSince1970: date))
    }
    
    func fetchRoomInfo() async {
        do {
            let querySnapshot = try await dataBase.collection("Room").getDocuments()
            
            DispatchQueue.main.async {
                let data = querySnapshot.documents.compactMap { document in
                    let data = document.data()
                    
                    return RoomAnnouncement(
                        id: data["id"] as? String ?? "",
                        roomName: data["name"] as? String ?? "",
                        placeId: data["placeId"] as? String ?? ""
                    )
                }
                self.roomInfoList = data.filter{
                    $0.placeId == self.sellerUid
                }
                print(self.roomInfoList)
            }
        } catch {
            print("공지사항 공간정보 패치 에러")
        }
    }
    
    func fetchRoomAnnouncement() async {
        do {
            let querySnapshot = try await dataBase.collection("RoomAnnouncement").getDocuments()
            
            DispatchQueue.main.async {
                self.announcementList = querySnapshot.documents.compactMap { document in
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let roomName = data["roomName"] as? String ?? ""
                    let announcementsData = data["announcements"] as? [[String: Any]] ?? []
                    
                    let announcements = announcementsData.compactMap { announcementData -> Announcement? in
                        guard
                            let title = announcementData["title"] as? String,
                            let content = announcementData["content"] as? String,
                            let date = announcementData["date"] as? Double
                        else {
                            return nil
                        }
                        
                        return Announcement(title: title, content: content, date: date)
                    }
                    
                    return RoomAnnouncement(id: id, roomName: roomName, placeId: "", announcements: announcements)
                }
            }
        } catch {
            print("공지사항 공간정보 패치 에러")
        }
    }
    
    func addAnnouncement(announcement: Announcement, selectedPlaces: [RoomAnnouncement]) {
        for selectedPlace in selectedPlaces {
            let documentRef = dataBase.collection("RoomAnnouncement").document(selectedPlace.id)
            
            documentRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    documentRef.updateData([
                        "announcements": FieldValue.arrayUnion([announcement.asDictionary()])
                    ]) { error in
                        if error != nil {
                            print("공지(만) 추가 에러")
                        } else {
                            print("Announcement updated successfully for \(selectedPlace.roomName)")
                        }
                    }
                } else {
                    documentRef.setData([
                        "id": selectedPlace.id,
                        "roomName": selectedPlace.roomName,
                        "announcements": [announcement.asDictionary()]
                    ]) { error in
                        if error != nil {
                            print("공간 및 공지 추가 에러")
                        } else {
                            print("Announcement added successfully for \(selectedPlace.roomName)")
                        }
                    }
                }
            }
        }
    }
    
    func deleteAnnouncement(announcement: Announcement, from roomInfo: RoomAnnouncement) {
    }
}
