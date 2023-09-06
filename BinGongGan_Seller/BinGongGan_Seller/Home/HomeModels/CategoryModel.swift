//
//  CategoryModel.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//

import Foundation
import SwiftUI

struct CategoryModel: Identifiable {
    var id: UUID = UUID()
    var imageString: String
    var categories: String
    var anyView: AnyView
    
    static let data = [
       CategoryModel(imageString: "list.bullet.clipboard.fill", categories: "예약관리", anyView: AnyView(ReservationDetailsView())),
       CategoryModel(imageString: "checkmark.seal.fill", categories: "승인내역", anyView: AnyView(EmptyView())),
       CategoryModel(imageString: "chart.xyaxis.line", categories: "통계", anyView: AnyView(EmptyView())),
       CategoryModel(imageString: "megaphone.fill", categories: "공지사항", anyView: AnyView(AnnouncementView())),
       CategoryModel(imageString: "map.fill", categories: "플레이스", anyView: AnyView(MyPlaceManagementView())),
       CategoryModel(imageString: "chart.bar.doc.horizontal.fill", categories: "리뷰관리", anyView: AnyView(ReviewManageView())),
       CategoryModel(imageString: "sparkles", categories: "이벤트", anyView: AnyView(EmptyView())),
       CategoryModel(imageString: "person", categories: "내 정보", anyView: AnyView(MyInfoVIew())),
]
}
