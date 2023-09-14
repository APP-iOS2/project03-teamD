//
//  ReservationTapBarView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationTapBarView : View {
    
    var reservationTapType : ReservationTapType
    
    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
            switch reservationTapType {
            case .list:
                ReservationDetailsListView()
            case .calendar:
                ReservationDetailsCalendarView()
//            }
        }
    }
}


struct ReservationTapBarView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationTapBarView(reservationTapType: .calendar)
    }
}

