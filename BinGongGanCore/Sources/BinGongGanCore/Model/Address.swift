//
//  File.swift
//  
//
//  Created by 신희권 on 2023/09/11.
//

import Foundation

public struct Address: Codable, Identifiable {
    public var id: UUID = UUID()
    public var address: String
    public var placeName: String
    public var x:String
    public var y:String
    public var longitude: Double {
        return Double(x) ?? 0
    }
    public var latitude: Double {
        return Double(y) ?? 0
    }
    
    public enum CodingKeys: String, CodingKey {
        case address = "address_name"
        case placeName = "place_name"
        case x = "x"
        case y = "y"
    }
    
    public init(address: String, placeName: String, x: String, y: String) {
        self.address = address
        self.placeName = placeName
        self.x = x
        self.y = y
    }
}

public struct AddressSearchResult: Codable {
   public var documents: [Address]
}
