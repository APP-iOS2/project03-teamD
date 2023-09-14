//
//  Announcement.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/08.
//

import Foundation
import FirebaseFirestoreSwift

struct Announcement: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var content: String
    var announcementType: AnnouncementType
    var createdAt: String
}

enum AnnouncementType: String, Codable, CaseIterable{
    case notice = "[공지]"
    case update = "[업데이트]"
    case error = "[장애]"
    case others = "[기타]"
}

