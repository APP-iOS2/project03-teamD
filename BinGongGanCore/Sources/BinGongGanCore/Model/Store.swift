//
//  Store.swift
//  
//
//  Created by 방유빈 on 2023/09/11.
//

import Foundation

//가게 정보 -> 가게 안에 여러개의 공간 (ex.101호, 102호 등) 들어갈 수 있음
public struct Store: Identifiable, Codable {
    public var id: String = UUID().uuidString //id
    public var sellerId: String //판매자id
    public var placeId: [String] //가게에 등록된 공간 정보 id
}
