//
//  Reservation.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import Foundation

struct SampleSpace {
    
    let spaceName: String
    let roomName: String
    let image: String
}

struct Reservation {
    
    let checkInDate: Date
    let checkOutDate: Date
    let hour: Int
    let personnel: Int
    
    let reservationPersonName: String
    let reservationPersonPhoneNumbere: String
    let reservationRequest: String
}
