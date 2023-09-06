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
    let imageString: String
    
    var imageUrl: URL {
        return URL(string: imageString) ?? URL(string: "https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg")!
    }
    
}

struct Reservation {
    
    let checkInDate = Date().timeIntervalSince1970
    let checkOutDate = Date().timeIntervalSince1970
    let hour: Int
    let personnel: Int
    
    let reservationName: String
    let reservationPhoneNumber: String
    let reservationRequest: String
}
