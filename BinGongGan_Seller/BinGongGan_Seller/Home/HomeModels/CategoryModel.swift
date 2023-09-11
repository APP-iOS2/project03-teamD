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
//       CategoryModel(imageString: "ApprovalDetails", categories: "승인내역", anyView: AnyView(ApprovedPlaceListView())),
       CategoryModel(imageString: "Statistics", categories: "통계", anyView: AnyView(ChartView())),
       CategoryModel(imageString: "Announcement", categories: "공지사항", anyView: AnyView(AnnouncementView())),
       CategoryModel(imageString: "MyPlace", categories: "내 공간", anyView: AnyView(MyPlaceManagementView())),
       CategoryModel(imageString: "ManagementReview", categories: "리뷰관리", anyView: AnyView(ReviewManageView())),
       CategoryModel(imageString: "Event", categories: "이벤트", anyView: AnyView(EventView())),
       CategoryModel(imageString: "MyInformation", categories: "내 정보", anyView: AnyView(MyInfoView())),
]
}
