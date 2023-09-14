//
//  MyReservationStore.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import Firebase

@MainActor
final class MyReservationStore: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var myReservations: [BinGongGanCore.Reservation] = []
    @Published var reservation: BinGongGanCore.Reservation = BinGongGanCore.Reservation(id: "", userEmail: "", roomID: "", placeID: ""  , reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", hour: 0, personnel: 0, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservationState: 0)
    
    @Published var selectedPicker: ReservationHistoryType = .all
    var filteredReservations: [BinGongGanCore.Reservation] {
        if selectedPicker != .all {
            return myReservations.filter {
                return $0.reservateStringCase == selectedPicker
            }
        }
        return myReservations
    }
    
    func fetchMyReservations(currentUser: String) async throws {
        var tempStore: [BinGongGanCore.Reservation] = []
        let query = db.collection("Reservation")
            .whereField("userEmail", isEqualTo: currentUser)
        
        do {
            let snapshot = try await query.getDocuments()
            let documents = snapshot.documents
            
            for document in documents {
                do {
                    var reservation = try document.data(as: BinGongGanCore.Reservation.self)
                    
                    let placeDocument = try await db.collection("Place").document(reservation.placeID).getDocument()
                    if let placeData = placeDocument.data() {
                        let addressMap: [String: Any] = placeData["address"] as? [String: Any] ?? [:]
                        let placeCategoryString = placeData["placeCategory"] as? String ?? "Share"
                        let placeCategory = PlaceCategory.fromRawString(placeCategoryString)
                        let place = Place(
                            sellerId: placeData["sellerId"] as? String ?? "sellerId",
                            placeName: placeData["placeName"] as? String ?? "placeName",
                            placeCategory: placeCategory,
                            placeImageStringList: placeData["placeImageStringList"] as? [String] ?? [""],
                            note: placeData["note"] as? [String] ?? [""],
                            placeInfomationList: placeData["placeInfomationList"] as? [String] ?? [""],
                            address: Address(
                                address: addressMap["address_name"] as? String ?? "sellerId",
                                placeName: addressMap["placeName_name"] as? String ?? "placeName",
                                longitude: addressMap["x"] as? String ?? "x",
                                latitude: addressMap["y"] as? String ?? "y")
                        )
                        reservation.place = place
                        let sellerDocument = try await db.collection("sellers").document(place.sellerId).getDocument()
                        if let sellerData = sellerDocument.data() {
                            let seller = Seller(id: sellerData["id"] as? String ?? "",
                                                name: sellerData["name"] as? String ?? "name",
                                                birthDate: sellerData["birthDate"] as? String ?? "birthDate",
                                                phoneNumber: sellerData["phoneNumber"] as? String ?? "phoneNumber",
                                                email: sellerData["email"] as? String ?? "email",
                                                nickname: sellerData["nickname"] as? String ?? "nickname",
                                                password: sellerData["password"] as? String ?? "password", bankName: sellerData["bankName"] as? String ?? "bankName",
                                                accountNumber: sellerData["accountNumber"] as? String ?? "accountNumber",
                                                registrationNum: sellerData["registrationNum"] as? String ?? "registrationNum",
                                                registrationImage: sellerData["registrationImage"] as? String ?? "registrationImage")
                            reservation.seller = seller
                            reservation.bankName = seller.bankName
                        }
                    }
                    tempStore.append(reservation)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.myReservations = tempStore
            self.sortReservationDate()
        } catch {
            print("Error getting document: \(error)")
        }
    }
    
    func reservationCancle(reservationId: String) {
        db.collection("Reservation")
            .document(reservationId)
            .setData([
                "reservationState": 4
            ],merge: true)
    }
    func sortReservationDate() {
        myReservations = myReservations.sorted { $0.checkInDateString > $1.checkInDateString }
    }
}
