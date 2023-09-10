//
//  Place.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation

public struct Place: Identifiable {
    public var id: String = UUID().uuidString //id
    public var sellerId: String //판매자 아이디
    public var placeName: String //이름
    public var placePrice: String //가격
    public var placeCategory: PlaceCategory //카테고리
    public var placeAddress: String //주소
    public var placeImageStringList: [String] // 이미지 링크
    public var informationToPass: String //가는길
    public var placeInfomationList: [String] //공간 정보
}

public enum PlaceCategory: String, CaseIterable, Identifiable {
    case 쉐어오피스, 밴드룸, 스튜디오, 키친룸
    public var id: Self { self }
}
