//
//  MyReservationStore.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/12.
//

import Foundation
import BinGongGanCore

final class MyReservationStore: ObservableObject {
    @Published var myReservations: [BinGongGanCore.Reservation] = []
    @Published var reservation: BinGongGanCore.Reservation = BinGongGanCore.Reservation(id: "", userEmail: "", roomID: "", reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", hour: 0, personnel: 0, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservateState: 0)
    
    
    init() {

        let sampleReservation: BinGongGanCore.Reservation =
            BinGongGanCore.Reservation(id: "A1020934902", userEmail: "test@test.test", roomID: "ㅁㄴㅇ", reservationYear: "2023", reservationMonth: "5", reservationDay: "10", checkInYear: "2023", checkInMonth: "5", checkInDay: "13", checkOutYear: "2023", checkOutMonth: "5", checkOutDay: "13", hour: 4, personnel: 2, reservationName: "조민근", reservationPhoneNumber: "01012311231", reservationRequest: "요청사항", reservateState: 0)
        
        
        let sampleReservation2: BinGongGanCore.Reservation =
            BinGongGanCore.Reservation(id: "A1020934902", userEmail: "test@test.test", roomID: "ㅋㅌㅊ", reservationYear: "2023", reservationMonth: "5", reservationDay: "10", checkInYear: "2023", checkInMonth: "5", checkInDay: "13", checkOutYear: "2023", checkOutMonth: "5", checkOutDay: "13", hour: 4, personnel: 2, reservationName: "촤하늘", reservationPhoneNumber: "01012311231", reservationRequest: "요청사항2", reservateState: 0)
        
        
        myReservations.append(sampleReservation)
        myReservations.append(sampleReservation2)
        
    }
}
