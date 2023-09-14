//
//  CategoryButtonsView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct CategoryButtonsView: View {
    @StateObject private var myInfoStore: MyInfoStore = MyInfoStore()
    @StateObject private var reviewStore: ReviewStore = ReviewStore()
    @StateObject private var rervationCalendarStore = RervationCalendarStore()

    @EnvironmentObject private var rervationStore : RervationStore
    @EnvironmentObject private var roomStore: RoomStore
    @EnvironmentObject private var placeStore: PlaceStore
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
 
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(CategoryName.allCases, id: \.self) { category in
                NavigationLink {
                    switch category {
                    case .managementReservation:
                        ReservationDetailsCalendarView()
                            .environmentObject(rervationCalendarStore)
                            .environmentObject(rervationStore)
//                        ReservationDetailsView()
//                            .environmentObject(rervationStore)
                    case .managementReview:
                        ReviewManageView()
                            .environmentObject(reviewStore)
                    case .announcement:
                        AnnouncementView(announcementStore: AnnouncementStore())
                    case .myPlace:
                        MyPlaceView()
                    case .statistics:
                        ChartView()
                    case .myInformation:
                        MyInfoView()
                            .environmentObject(myInfoStore)
                    }
                    
                } label: {
                    CategoryButton(imageString: category.imageString, categoryName: category.nameString)
                }
            }
        }
        .background(Color.clear)
        .frame(maxHeight: .infinity)
    }
}

struct CategoryButtonsViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoryButtonsView()
        }
    }
}
