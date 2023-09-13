//
//  Place.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation

public struct Place:Identifiable, Codable {
    public var sellerId: String //판매자 id
    public var placeName: String //이름
    public var placeCategory: PlaceCategory //카테고리 -
    public var placeImageStringList: [String] // 이미지 링크 -
    public var placeFirstImage: String {
        return "https://item.kakaocdn.net/do/250a652a90a81a02368ef14505ded6d38b566dca82634c93f811198148a26065"
    }
    public var note: [String] //공간 내용 -
    public var placeInfomationList: [String] //공간 정보
    public var address: Address //주소
  
    public var id: String {
        return sellerId
    }
  
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
             self.placeCategory = .share
             self.placeImageStringList = []
             self.note = []
             self.placeInfomationList = []
             self.address = Address()
       }
}

public enum PlaceCategory: String, CaseIterable, Identifiable, Codable {
    case share
    case band
    case studio
    case kitchen
    public var id: Self { self }
    
    public var placeCategoryName: String {
        switch self {
        case .share:
            return "쉐어오피스"
        case .band:
            return "밴드룸"
        case .studio:
            return "스튜디오"
        case .kitchen:
            return "키친룸"
        }
    }
    
    public static func fromRawString(_ rawString: String) -> PlaceCategory {
           switch rawString {
           case "쉐어오피스":
               return .share
           case "밴드룸":
               return .band
           case "스튜디오":
               return .studio
           case "키친룸":
               return .kitchen
           default:
               return .share
           }
       }
}
