//
//  Announcement.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation
import FirebaseFirestoreSwift

//MARK: - 패키지로 뺴기
struct SystemAnnouncement: Identifiable, Codable {
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
