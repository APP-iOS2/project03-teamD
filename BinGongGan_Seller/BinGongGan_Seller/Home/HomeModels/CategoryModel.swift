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
       CategoryModel(imageString: "ManagementReservation", categories: "예약관리", anyView: AnyView(ReservationDetailsView())),
       CategoryModel(imageString: "ManagementReview", categories: "리뷰관리", anyView: AnyView(ReviewManageView())),
       CategoryModel(imageString: "Announcement", categories: "공지사항", anyView: AnyView(AnnouncementView())),
       CategoryModel(imageString: "Event", categories: "이벤트", anyView: AnyView(EmptyView())),
       CategoryModel(imageString: "MyPlace", categories: "내 공간", anyView: AnyView(MyPlaceView())),
       CategoryModel(imageString: "Statistics", categories: "통계", anyView: AnyView(ChartView())),
       CategoryModel(imageString: "MyInformation", categories: "내 정보", anyView: AnyView(MyInfoView())),
]
}
