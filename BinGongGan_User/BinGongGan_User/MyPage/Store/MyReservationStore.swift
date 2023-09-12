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
    @Published var reservation: BinGongGanCore.Reservation = BinGongGanCore.Reservation(id: "", userEmail: "", roomID: "", reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", hour: 0, personnel: 0, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservateState: .all)
    
    @Published var selectedPicker: ReservationHistoryType = .all
    var filteredReservations: [BinGongGanCore.Reservation] {
        if selectedPicker != .all {
            return myReservations.filter {
                return $0.reservateState == selectedPicker
           }
        }
        return myReservations
    }
    
    init() {
        let sampleReservation: BinGongGanCore.Reservation =
        BinGongGanCore.Reservation(id: "1", userEmail: "1", roomID: "1", reservationYear: "1", reservationMonth: "1", reservationDay: "1", checkInYear: "1", checkInMonth: "1", checkInDay: "1", checkOutYear: "1", checkOutMonth: "5", checkOutDay: "1", hour: 4, personnel: 2, reservationName: "조민근", reservationPhoneNumber: "1", reservationRequest: "1", reservateState: .cancel)
        
        
        let sampleReservation2: BinGongGanCore.Reservation =
        BinGongGanCore.Reservation(id: "2", userEmail: "2", roomID: "2", reservationYear: "2", reservationMonth: "2", reservationDay: "2", checkInYear: "2", checkInMonth: "2", checkInDay: "2", checkOutYear: "2", checkOutMonth: "2", checkOutDay: "2", hour: 4, personnel: 2, reservationName: "촤하늘", reservationPhoneNumber: "2", reservationRequest: "요청사항2", reservateState: .success)

        myReservations.append(sampleReservation)
        myReservations.append(sampleReservation2)
        
    }
}
