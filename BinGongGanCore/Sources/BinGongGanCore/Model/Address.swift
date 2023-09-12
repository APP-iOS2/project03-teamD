//
//  File.swift
//  
//
//  Created by 신희권 on 2023/09/11.
//

import Foundation

public struct Address: Codable {
    public var address: String
    public var placeName: String
    public var longitude: String
    public var latitude: String
    public var longitudeDouble: Double {
        return Double(longitude) ?? 0
    }
    public var latitudeDouble: Double {
        return Double(latitude) ?? 0
    }
    
    public enum CodingKeys: String, CodingKey {
        case address = "address_name"
        case placeName = "place_name"
        case longitude = "x"
        case latitude = "y"
    }
    
    public init(address: String, placeName: String, longitude: String, latitude: String) {
        self.address = address
        self.placeName = placeName
        self.longitude = longitude
        self.latitude = latitude
    }
    
    public init() {
        self.address = ""
        self.placeName = ""
        self.longitude = ""
        self.latitude = ""
    }
    
}

public struct AddressSearchResult: Codable {
   public var documents: [Address]
}
