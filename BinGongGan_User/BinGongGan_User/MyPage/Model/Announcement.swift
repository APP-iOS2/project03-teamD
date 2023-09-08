//
//  Announcement.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/08.
//

import Foundation

struct Announcement: Identifiable {
    let id: UUID = UUID()
    let title: String
    let content: String
    let announcementType: AnnouncementType
    let createdAt: String
}

extension Announcement {
    static let sampleAnnouncement: [Announcement] = [
        Announcement(title: "빈공간 ver 1.0.2 업데이트", content: "새로운 버전이 업데이트 됐습니다.", announcementType: .update, createdAt: "2023-09-05"),
        Announcement(title: "빈공간 앱 출시!", content: "드디어 출시 됐습니다.", announcementType: .notice, createdAt: "2023-09-05"),
        Announcement(title: "결제 오류", content: "드디어 출시 됐습니다.", announcementType: .error, createdAt: "2023-09-04"),
    ]
}

enum AnnouncementType: String {
    case notice = "[공지]"
    case update = "[업데이트]"
    case error = "[장애]"
}

