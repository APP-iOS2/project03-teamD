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
    
    var imageUrl: URL {
        if let url = URL(string: image) {
            return url
        } else {
            return URL(string: "https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg")!
        }
    }
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
