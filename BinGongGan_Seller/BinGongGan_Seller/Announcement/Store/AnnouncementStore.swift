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
        Announcement(title: "hello", content: "hello"),
        Announcement(title: "hi", content: "hi")
    ]
    
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
}
