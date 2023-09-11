//
//  DateValue.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import Foundation

struct DateValue: Identifiable {
    let id = UUID().uuidString
    let day: Int
    let date: Date
}
