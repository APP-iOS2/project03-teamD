//
//  AnnouncementStore.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

class AnnouncementStore: ObservableObject {
    @Published var announcementList: [Announcement] = []
    @Published var placeInfoList: [PlaceInfo] = []
    
    let dataBase = Firestore.firestore()
    
    func formattedDate(from date: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd"
        return dateFormatter.string(from: Date(timeIntervalSince1970: date))
    }
    
    func fetchPlaceInfo() async {
        do {
            let querySnapshot = try await dataBase.collection("Room").getDocuments()
            
            DispatchQueue.main.async {
                self.placeInfoList = querySnapshot.documents.compactMap { document in
                    let data = document.data()
                    
                    return PlaceInfo(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? ""
                        
                    )
                }
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
                    
                    if let id = data["id"] as? String,
                       let title = data["title"] as? String,
                       let content = data["content"] as? String,
                       let date = data["date"] as? Double,
                       let placesData = data["places"] as? [[String: Any]] {
                        
                        var places = [PlaceInfo]()
                        for placeData in placesData {
                            if let placeId = placeData["id"] as? String,
                               let placeName = placeData["name"] as? String {
                                let place = PlaceInfo(id: placeId, name: placeName)
                                places.append(place)
                            }
                        }
                        
                        return Announcement(id: id, title: title, content: content, date: date, places: places)
                    }
                    
                    print("공간 공지사항 패치 에러")
                    
                    return nil
                }
            }
        } catch {
            print("공간 공지사항 패치 에러")
        }
    }
    
    func addAnnouncement(announcement: Announcement) {
        dataBase.collection("RoomAnnouncement").addDocument(data: announcement.asDictionary()) { error in
            if error != nil {
                print("공지 등록 에러")
            }
        }
    }
}
