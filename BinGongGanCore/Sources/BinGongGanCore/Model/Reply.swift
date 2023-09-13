//
//  Reply.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation
import FirebaseFirestoreSwift

public struct Reply: Identifiable, Codable {
    public var id: String?
    public var content: String //답글 내용
    public var date: String //작성일
    
    public init(id: String, content: String, date: String) {
        self.id = id
        self.content = content
        self.date = date
    }
}
