//
//  Place.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation

public struct Place:Identifiable, Codable {
    public var id: String = UUID().uuidString //id
    public var sellerId: String //판매자 id
    public var placeName: String //이름
    public var placeCategory: PlaceCategory //카테고리
    public var placeImageStringList: [String] // 이미지 링크
    public var note: [String] //공간 내용
    public var placeInfomationList: [String] //공간 정보
    public var address: Address //주소
    
    public init(sellerId: String,placeName: String, placeCategory: PlaceCategory, placeImageStringList: [String], note: [String], placeInfomationList: [String], address: Address) {
        self.sellerId = sellerId
        self.placeName = placeName
        self.placeCategory = placeCategory
        self.placeImageStringList = placeImageStringList
        self.note = note
        self.placeInfomationList = placeInfomationList
        self.address = address
    }
    
    public init() {
        self.sellerId = ""
          self.placeName = ""
          self.placeCategory = .Share // 또는 다른 기본값
          self.placeImageStringList = []
          self.note = []
          self.placeInfomationList = []
          self.address = Address() // Address 초기화자 호출
    }
    
}

public enum PlaceCategory: String, CaseIterable, Identifiable, Codable {
    case Share = "쉐어오피스"
    case band = "밴드룸"
    case studio = "스튜디오"
    case kitchen = "키친룸"
    public var id: Self { self }
}
