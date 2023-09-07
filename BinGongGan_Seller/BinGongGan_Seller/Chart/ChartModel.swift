//
//  ChartModel.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/06.
//

import Foundation

struct Gender: Identifiable {
    let name: String
    let count: Int
    
    var id: String { name }
    
}

struct Monthly: Identifiable {
    var id = UUID()
    let month: String
    let value: Int
}

let genders: [Gender] = [
    .init(name: "남자", count: 250),
    .init(name: "여자", count: 100),
]

let monthly: [Monthly] = [
    .init(month: "1월", value: 50),
    .init(month: "2월", value: 150),
    .init(month: "3월", value: 230),
    .init(month: "4월", value: 850),
    .init(month: "5월", value: 1150),
    .init(month: "6월", value: 2250),
    .init(month: "7월", value: 3250),
    .init(month: "8월", value: 4250),
    .init(month: "9월", value: 1250),
    .init(month: "10월", value: 50),
    .init(month: "11월", value: 250),
    .init(month: "12월", value: 350),
    
]

enum ChartType :String, CaseIterable, Identifiable {
    case bar = "성별 차트"
    case line = "월 차트"
    
    var id: Self { self }
}

