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
    @Published var announcementList: [Announcement] = [
        Announcement(title: "hello", content: "hello", places: [PlaceInfo(id: "1", name: "Place 1")]),
        Announcement(title: "hi", content: "hi", places: [PlaceInfo(id: "1", name: "Place 1")])
    ]
    @Published var placeInfoList: [PlaceInfo] = []
    
    let dataBase = Firestore.firestore().collection("Room")
    
    //    let dataBase = Firestore.firestore().collection("Place")
    //
    //    func addAnnouncement(announcement: Announcement) {
    //        dataBase.document(announcement.id)
    //            .setData(announcement.asDictionary())
    //                print("공지 등록 완료")
    //    }
    
    func addAnnouncmentDummy(announcement: Announcement) {
        announcementList.append(announcement)
    }
    
    func formattedDate(from date: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd"
        return dateFormatter.string(from: Date(timeIntervalSince1970: date))
    }
    
    func placeInfoFetch() async {
        do {
            let querySnapshot = try await dataBase.getDocuments()
            
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
            print("Error fetching Place: \(error)")
        }
    }
}
