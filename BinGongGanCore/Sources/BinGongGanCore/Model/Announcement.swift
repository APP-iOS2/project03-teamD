//
//  File.swift
//  
//
//  Created by 오영석 on 2023/09/12.
//

import Foundation

public struct Announcement: Identifiable, Codable {
    public var id: String = UUID().uuidString
    public var title: String
    public var content: String
    public var date: Double = Date().timeIntervalSince1970
//    public var place: [Place]
    
    public init(id: String = UUID().uuidString, title: String, content: String, date: Double = Date().timeIntervalSince1970) {
            self.id = id
            self.title = title
            self.content = content
            self.date = date
//            self.place = place
        }
}
