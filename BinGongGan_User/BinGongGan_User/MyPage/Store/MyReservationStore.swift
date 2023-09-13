//
//  MyReservationStore.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

final class MyReservationStore: ObservableObject {
    
    let dataBase = Firestore.firestore().collection("Reservation")
    
    @Published var myReservations: [BinGongGanCore.Reservation] = []
    @Published var reservation: BinGongGanCore.Reservation = BinGongGanCore.Reservation(id: "", userEmail: "", roomID: "", reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", hour: 0, personnel: 0, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservateState: 0)
    
    @Published var selectedPicker: ReservationHistoryType = .all
    var filteredReservations: [BinGongGanCore.Reservation] {
        if selectedPicker != .all {
            return myReservations.filter {
                return $0.reservateStringCase == selectedPicker
           }
        }
        return myReservations
    }
    
    
    func fetchMyReservations() async {
//        do {
//            var tempStore: [BinGongGanCore.Reservation] = []
//            let querySnapshot = try await dataBase.getDocuments()
//
//            for document in querySnapshot.documents {
//                let data = document.data()
//                let addressMap: [String: Any] = data["address"] as? [String: Any] ?? [:]
//                let placeImageStringList: [String] = data["placeImageStringList"] as? [String] ?? [""]
//                let place = Place (
//                    placeName: addressMap["place_name"] as? String ?? "",
//                    category: data["placeCategory"] as? String ?? "",
//                    placeLocation: addressMap["address_name"] as? String ?? "",
//                    placePrice: data["place_Price"] as? Int ?? 16000,
//                    imageString: placeImageStringList[0],
//                    isFavorite: data["isFavorite"] as? Bool ?? false
//                )
//                tempStore.append(place)
//            }
//            self.places = tempStore
//        } catch {
//            print("Error fetching Place: (error)")
//        }
    }
 
}
