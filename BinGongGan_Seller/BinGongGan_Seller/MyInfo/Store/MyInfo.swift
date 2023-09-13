//
//  MyInfo.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/13.
//

import Foundation

struct MyInfo: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var email: String
    var phoneNumber: String
    var accountNumber: String
    var companyNumber: String
}
