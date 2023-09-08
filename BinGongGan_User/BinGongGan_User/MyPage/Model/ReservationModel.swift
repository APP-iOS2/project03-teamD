//
//  ReservationModel.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/06.
//

import Foundation

struct ReservationModel: Identifiable {
    var id: UUID = UUID()
    var placeName: String
    var reservationNumber: String
    var reservationDate: String
    var reservationTime: String
    var reservationPersonal: Int
    var placeAddress: String
    var isReservation: Bool   // 나중에 Date랑 오늘날짜랑 비교해서 지났으면 true 연산프로퍼티로 만들 계획
}

let reservates: [ReservationModel] = [
    
    ReservationModel(placeName: "하늘이네", reservationNumber: "A103120185", reservationDate: "2023.9.7 (목)", reservationTime: "13:00 ~ 17:00" , reservationPersonal: 5, placeAddress: "서울특별시 하늘구", isReservation: false) ,
    
    ReservationModel(placeName: "희권이네 설빙", reservationNumber: "A103120235", reservationDate: "2023.9.7 (목)", reservationTime: "17:00 ~ 21:00" , reservationPersonal: 5, placeAddress: "서울특별시 희권구", isReservation: true),
    
    ReservationModel(placeName: "유빈이네", reservationNumber: "A103120123", reservationDate: "2023.9.5 (화)", reservationTime: "12:00 ~ 18:00" , reservationPersonal: 3, placeAddress: "충청북도 예산군 유빈읍", isReservation: true) ,
    
    ReservationModel(placeName: "윤호네", reservationNumber: "A103120145", reservationDate: "2023.9.5 (화)", reservationTime: "18:00 ~ 21:00" , reservationPersonal: 3, placeAddress: "충청북도 대천군 윤호읍", isReservation: true)
    ]
