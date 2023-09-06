//
//  CategoryModel.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//

import Foundation

struct CategoryModel: Identifiable {
    var id: UUID = UUID()
    var categories: [String] = ["예약관리", "승인내역", "통계", "공지사항", "플레이스", "리뷰관리", "이벤트", "내 정보"]
}
