//
//  ReportCase.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/06.
//

import Foundation

enum ReportCase: String, CaseIterable, Codable {
    case unrelated = "관련 없는 글"
    case spamFlagging = "스팸/도배 글"
    case obscenity = "음란물"
    case offensiveLanguage = "불쾌한 표현"
    case etc = "기타 사유"
}
