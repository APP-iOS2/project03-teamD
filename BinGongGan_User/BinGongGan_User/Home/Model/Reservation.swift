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

struct ReservationRoom: Codable {
    let id: String
    let imageNames: [String]
    let name: String
    let price: String
    let placeId: String
    let note: String
}


struct Reservation: Codable {
    
    var userEmail: String
    
    var placeID: String
    var roomID: String
    
    var id: String = UUID().uuidString
    var reservationState: Int
    
    var reservationYear: String
    var reservationMonth: String
    var reservationDay: String
    
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
    
    var reservationCancelReason: String
    
}
