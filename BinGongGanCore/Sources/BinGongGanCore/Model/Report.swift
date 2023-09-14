//
//  File.swift
//
//
//  Created by 박채영 on 2023/09/13.
//

import Foundation

public struct Report: Identifiable, Codable {
    public var id: String = UUID().uuidString
    public var reviewId: String
    public var sellerId: String
    public var reason: String // 신고 사유
    
    public init(reviewId: String, sellerId: String, reason: String) {
        self.reviewId = reviewId
        self.sellerId = sellerId
        self.reason = reason
    }
}
