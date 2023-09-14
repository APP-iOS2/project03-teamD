//
//  AdminReply.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/14.
//

import Foundation
import BinGongGanCore

struct AdminReply: Identifiable, Codable {
    var id: UUID = UUID()
    let reply: Reply
    let review: Review
    let place: Place
    let writer: User
}

