//
//  AdminPosting.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation
import BinGongGanCore

struct AdminPoting: Identifiable, Codable {
    var id: UUID = UUID()
    let place: Place
    let seller: Seller
    let rooms: [Room]
}
