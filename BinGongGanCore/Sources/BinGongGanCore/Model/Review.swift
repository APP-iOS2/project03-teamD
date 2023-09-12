//
//  Review.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation

public struct Review: Identifiable {
    public var id: String = UUID().uuidString
    public var placeId: String //리뷰 달린 공간 id값
    public var writerId: String
    public var date: Double = Date().timeIntervalSince1970 //작성 날짜
    public var rating: Double //별점
    public var content: String //내용
    public var reviewImageStringList: [String]? //리뷰 이미지
}
