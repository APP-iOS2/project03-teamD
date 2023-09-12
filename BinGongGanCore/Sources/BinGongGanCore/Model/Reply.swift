//
//  Reply.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation
import FirebaseFirestoreSwift

public struct Reply: Identifiable, Codable {
    @DocumentID public var reviewId: String? //답글 단 리뷰 id
    public var content: String //답글 내용
    public var date: String //작성일
    
    public var id: String? {
        return reviewId
    }
    
    public init(reviewId: String, content: String, date: String) {
        self.reviewId = reviewId
        self.content = content
        self.date = date
    }
}
