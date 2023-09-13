//
//  File.swift
//  
//
//  Created by 박채영 on 2023/09/13.
//

import Foundation
import FirebaseFirestoreSwift

public struct Report: Identifiable, Codable {
    @DocumentID public var reviewId: String?
    
    public var reason: String // 신고 사유
    public var id: String? {
        return reviewId
    }
    
    public init(reviewId: String, reason: String) {
        self.reviewId = reviewId
        self.reason = reason
    }
}
