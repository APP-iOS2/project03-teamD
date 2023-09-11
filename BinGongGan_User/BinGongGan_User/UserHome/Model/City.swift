//
//  City.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/11.
//

import Foundation

struct City: Identifiable {
    let id = UUID().uuidString
    let name: String
    let subCity: SubCity
}

struct SubCity: Identifiable {
    let id = UUID().uuidString
    let name: [String]
}
