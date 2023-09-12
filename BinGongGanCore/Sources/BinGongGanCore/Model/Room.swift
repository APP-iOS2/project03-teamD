//
//  File.swift
//
//
//  Created by 신희권 on 2023/09/12.
//
import Foundation

public struct Room: Codable, Identifiable {
    public var id = UUID().uuidString
    public var placeId: String
    public var name: String
    public var price: String
    public var note: String
    public var imageNames: [String]

    public init(placeId: String, name: String, price: String, note: String, imageNames: [String]) {
        self.placeId = placeId
        self.name = name
        self.price = price
        self.note = note
        self.imageNames = imageNames
    }

    public init() {
        self.placeId = ""
        self.name = ""
        self.price = ""
        self.note = ""
        self.imageNames = []
    }
}
