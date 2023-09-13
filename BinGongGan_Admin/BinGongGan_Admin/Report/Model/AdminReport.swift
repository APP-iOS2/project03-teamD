//
//  AdminReport.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/14.
//

import Foundation
import BinGongGanCore

struct AdminReport: Identifiable, Codable {
    var id: UUID = UUID()
    let report: Report
    let review: Review
    let seller: Seller
}
