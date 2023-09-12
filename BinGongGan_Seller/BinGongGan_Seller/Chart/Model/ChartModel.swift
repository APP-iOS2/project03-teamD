//
//  ChartModel.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/06.
//

import Foundation

struct MonthlyData: Identifiable {
    var id: String = UUID().uuidString
    
    var category: String
    var month: String
    var value: Double
}
