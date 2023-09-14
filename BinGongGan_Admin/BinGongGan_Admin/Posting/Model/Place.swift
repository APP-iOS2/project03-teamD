//
//  Place.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/14.
//

import Foundation

struct Place: Identifiable, Codable {
    var sellerId: String //판매자 id
    var placeName: String //이름
    var placeCategory: String //카테고리 -
    var placeImageStringList: [String] // 이미지 링크 -
    var placeImageString: String {
        print("지금 여길 확인하고 있어요 \(placeImageStringList)")
        if !placeImageStringList.isEmpty {
            return placeImageStringList[0]
        } else {
            return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNrDzAAsGUNWG4_XHOoiO0r3maZPFRQ4YqylZ40DT4lSLBflDVbD_w6IIxEFIslGm9KW8&usqp=CAU"
        }
    }
    var note: [String] //공간 내용 -
    var placeInfomationList: [String] //공간 정보
    var address: Address //주소
    
    public var id: String {
        return sellerId
    }
}

struct Address: Codable {
    var address: String
    var placeName: String
    var longitude: String
    var latitude: String
    var longitudeDouble: Double {
        return Double(longitude) ?? 0
    }
    var latitudeDouble: Double {
        return Double(latitude) ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
        case address = "address_name"
        case placeName = "place_name"
        case longitude = "x"
        case latitude = "y"
    }
}

struct AddressSearchResult: Codable {
    var documents: [Address]
}
