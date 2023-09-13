//
//  File.swift
//
//
//  Created by 오영석 on 2023/09/12.
//

import Foundation


public struct RoomAnnouncement: Identifiable, Codable {
    public var id: String = UUID().uuidString
    public var roomName: String
    public var placeId: String
    public var announcements: [Announcement]
    
    public init(id: String = UUID().uuidString, roomName: String,placeId:String, announcements: [Announcement] = []) {
        self.id = id
        self.roomName = roomName
        self.placeId = placeId
        self.announcements = announcements
    }
}

public struct Announcement: Identifiable, Codable {
    public var id: String = UUID().uuidString
    public var title: String
    public var content: String
    public var date: Double = Date().timeIntervalSince1970
    
    public init(id: String = UUID().uuidString, title: String, content: String, date: Double = Date().timeIntervalSince1970) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
    }
}
