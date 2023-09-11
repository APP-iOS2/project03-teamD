//
//  ReservationCalendar.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import Foundation

struct ReservationCalendar: Identifiable {
    var id = UUID().uuidString
    ///에약 내역
    var reservationDetails: [ReservationDetails]
    ///에약 날짜
    var reservationDate: Date
    
    struct ReservationDetails: Identifiable {
        var id = UUID().uuidString
        ///예약 이름
        var title: String
        ///예약 시간
        var time: Date = Date()

    }
    
}
