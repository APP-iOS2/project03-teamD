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
    
    var userEmail: String
    var roomID: String
    
    var reservationID: String
    var reservationDate: String
    
    var checkInYear: String
    var checkInMonth: String
    var checkInDay: String
    
    var checkOutYear: String
    var checkOutMonth: String
    var checkOutDay: String
    
    
    var hour: Int
    var personnel: Int
    
    var reservationName: String
    var reservationPhoneNumber: String
    var reservationRequest: String
    
}
