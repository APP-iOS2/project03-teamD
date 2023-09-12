//
//  ReportStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/10.
//

import Foundation

struct Report: Identifiable {
    var id: String = UUID().uuidString
    
    var title: String
    var isSelected: Bool
}

final class ReportStore: ObservableObject {
    @Published var reports: [Report] = [
        Report(title: ReportCase.unrelated.rawValue, isSelected: false),
        Report(title: ReportCase.spamFlagging.rawValue, isSelected: false),
        Report(title: ReportCase.obscenity.rawValue, isSelected: false),
        Report(title: ReportCase.offensiveLanguage.rawValue, isSelected: false),
        Report(title: ReportCase.etc.rawValue, isSelected: false)
    ]
}
