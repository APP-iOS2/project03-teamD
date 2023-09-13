//
//  CategoryModel.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//

import SwiftUI

enum CategoryName: String, CaseIterable {
    case managementReservation
    case managementReview
    case announcement
    case myPlace
    case statistics
    case myInformation
    
    var imageString: String {
        return self.rawValue.prefix(1).capitalized + self.rawValue.dropFirst()
    }
    
    var nameString: String {
        switch self {
        case .managementReservation:
            return "예약관리"
        case .managementReview:
            return "리뷰관리"
        case .announcement:
            return "공지사항"
        case .myPlace:
            return "내 공간"
        case .statistics:
            return "통계"
        case .myInformation:
            return "내 정보"
        }
    }
}
