//
//  ReservationCalendar.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import Foundation

struct ReservationCalendar: Identifiable {
    let id = UUID().uuidString
    ///에약 갯수
    let reservationCount: Int
    ///에약 날짜
    let reservationDate: Date
    
  
    
}
