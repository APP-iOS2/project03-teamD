//
//  ReservationCalendar.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import Foundation

struct ReservationCalendar: Identifiable {
    let id = UUID().uuidString
    ///에약 내역
    let reservationDetails: [ReservationDetails]
    ///에약 날짜
    let reservationDate: Date
    
    struct ReservationDetails: Identifiable {
        let id = UUID().uuidString
        ///예약 이름
        let title: String
        ///예약 시간
        let time: Date = Date()

    }
    
}
