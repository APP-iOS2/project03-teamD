//
//  File.swift
//  
//
//  Created by 박채영 on 2023/09/13.
//

import Foundation
import FirebaseFirestoreSwift

public struct Report: Identifiable, Codable {
    public var id: String?
    public var reason: String // 신고 사유
    
    public init(id: String, reason: String) {
        self.id = id
        self.reason = reason
    }
}
