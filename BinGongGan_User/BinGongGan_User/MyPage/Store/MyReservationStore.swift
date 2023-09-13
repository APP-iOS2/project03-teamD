//
//  MyReservationStore.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

@MainActor
final class MyReservationStore: ObservableObject {
    
    let dataBase = Firestore.firestore().collection("Reservation")
    
    @Published var myReservations: [BinGongGanCore.Reservation] = []
    @Published var reservation: BinGongGanCore.Reservation = BinGongGanCore.Reservation(id: "", userEmail: "", roomID: "", placeID: "" , sellerID: "" , reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", hour: 0, personnel: 0, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservateState: 0)
    
    @Published var selectedPicker: ReservationHistoryType = .all
    var filteredReservations: [BinGongGanCore.Reservation] {
        if selectedPicker != .all {
            return myReservations.filter {
                return $0.reservateStringCase == selectedPicker
            }
        }
        return myReservations
    }
    
    init() {
        Task {
            await fetchMyReservations()
        }
    }
    
    func fetchMyReservations() async {
        do {
            self.myReservations.removeAll()
            var tempStore: [BinGongGanCore.Reservation] = []
            let querySnapshot = try await dataBase.getDocuments()
            
            for document in querySnapshot.documents {
                let id = document.documentID
                let data = document.data()
                let userEmail = data["userEmail"] as? String ?? "(userEmail 없음)"
                let roomID = data["roomID"] as? String ?? "(roomID 없음)"
                let placeID = data["placeID"] as? String ?? "(placeID 없음)"
                let sellerID = data["sellerID"] as? String ?? "(sellerID 없음)"
                let reservationYear = data["reservationYear"] as? String ?? "(reservationYear 없음)"
                let reservationMonth = data["reservationMonth"] as? String ?? "(reservationMonth 없음)"
                let reservationDay = data["reservationDay"] as? String ?? "(reservationDay 없음)"
                let checkInYear = data["checkInYear"] as? String ?? "(checkInYear 없음)"
                let checkInMonth = data["checkInMonth"] as? String ?? "(checkInMonth 없음)"
                let checkInDay = data["checkInDay"] as? String ?? "(checkInDay 없음)"
                let checkOutYear = data["checkOutYear"] as? String ?? "(checkOutYear 없음)"
                let checkOutMonth = data["checkOutMonth"] as? String ?? "(checkOutMonth 없음)"
                let checkOutDay = data["checkOutDay"] as? String ?? "(checkOutDay 없음)"
                let hour = data["hour"] as? Int ?? 0
                let personnel = data["personnel"] as? Int ?? 0
                
                
                
                let reservationName = data["reservationName"] as? String ?? "(reservationName 없음)"
                let reservationPhoneNumber = data["reservationPhoneNumber"] as? String ?? "(reservationPhoneNumber 없음)"
                let reservationRequest = data["reservationRequest"] as? String ?? "(reservationRequest 없음)"
                let reservateState = data["reservationState"] as? Int ?? 0
                
                
                let reservations = BinGongGanCore.Reservation(id: id, userEmail: userEmail, roomID: roomID, placeID: placeID , sellerID: sellerID , reservationYear: reservationYear, reservationMonth: reservationMonth, reservationDay: reservationDay, checkInYear: checkInYear, checkInMonth: checkInMonth, checkInDay: checkInDay, checkOutYear: checkOutYear, checkOutMonth: checkOutMonth, checkOutDay: checkOutDay, hour: hour, personnel: personnel, reservationName: reservationName, reservationPhoneNumber: reservationPhoneNumber, reservationRequest: reservationRequest, reservateState: reservateState)
                
                tempStore.append(reservations)
            }
            self.myReservations = tempStore
        } catch {
            print("Error fetching Place: (error)")
        }
    }
    
}
