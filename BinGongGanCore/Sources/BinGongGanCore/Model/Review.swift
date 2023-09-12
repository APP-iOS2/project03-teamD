//
//  Review.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation
import FirebaseFirestoreSwift

public struct Review: Identifiable, Codable {
    @DocumentID public var id: String?
    public var placeId: String //리뷰 달린 공간 id값
    public var writerId: String
    public var date: String //작성 날짜
    public var rating: Int //별점
    public var content: String //내용
    public var reviewImageStringList: [String]? //리뷰 이미지
    
    public init(id: String = UUID().uuidString, placeId: String, writerId: String, date: String, rating: Int, content: String, reviewImageStringList: [String]? = nil) {
        self.id = id
        self.placeId = placeId
        self.writerId = writerId
        self.date = date
        self.rating = rating
        self.content = content
        self.reviewImageStringList = reviewImageStringList
    }
}
