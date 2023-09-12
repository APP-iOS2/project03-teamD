//
//  Reply.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation

public struct Reply: Identifiable, Codable {
    public var reviewId: String //답글 단 리뷰 id
    public var content: String //답글 내용
    public var date: Double = Date().timeIntervalSince1970 //작성일
    
    public var id: String {
        return reviewId
    }
}
