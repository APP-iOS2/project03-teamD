//
//  PlaceModel.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/06.
//

import Foundation

//struct Store: Identifiable {
//    let id: String = UUID().uuidString
//    let place: [PlaceModel]
//}
//
//struct PlaceModel: Identifiable {
//    let id:String = UUID().uuidString
//    let storeID: String
//    var placeName: String
//    var placePrice: String
//    var placeCategory: PlaceCategory
//    var placeAdress: String
//    var placeImageStringList: [String]
//    var note: String
//    var placeInfomationList: [String]
//    var date: [reservationDate?] //예약 날짜 EX) 07.29
//   // var reservationUser: User?
//    
//    var reviews: [Review]?
//}

struct reservationDate: Identifiable {
    let id: String = UUID().uuidString
    let placeID: String // 공간ID
    var hour: [reseravtionHour] //예약 시간 EX)1시 2시
    
}

struct reseravtionHour {
    let dateID: String // 시간ID
    var hour: String //시간이름  EX) 1시 2시
    var isReservation: Bool //예약여부 EX)예약 완료된 시간이묜 True
}



struct Review: Identifiable {
    let id: String = UUID().uuidString
    let date: String
    var rating: Double
    var content: String
}
