//
//  ReportStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/10.
//

import Foundation
import BinGongGanCore

struct Report: Identifiable {
    var id: String = UUID().uuidString
    
    var reason: String
    var isSelected: Bool
}

final class ReportStore: ObservableObject {
    @Published var reportedReviews: [Review] = []
    
    var reportCategory: [Report] = [
        Report(reason: ReportCase.unrelated.rawValue, isSelected: false),
        Report(reason: ReportCase.spamFlagging.rawValue, isSelected: false),
        Report(reason: ReportCase.obscenity.rawValue, isSelected: false),
        Report(reason: ReportCase.offensiveLanguage.rawValue, isSelected: false),
        Report(reason: ReportCase.etc.rawValue, isSelected: false)
    ]
    
    func reportReview(selectedReview: Review) {
        reportedReviews.append(selectedReview)
    }
}
