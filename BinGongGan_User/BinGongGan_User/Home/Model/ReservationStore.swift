//
//  ReservationStore.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

final class ReservationStore: ObservableObject {
    
    @Published var reservation: Reservation
    @Published var reservationRoom: ReservationRoom?
    @Published var sellerAccount: String = ""
    
    @Published var isPolicyChecked: Bool = false
    
     let sampleSpace: SampleSpace = SampleSpace(spaceName: "[서울역] 갬성 파티룸", roomName: "202호 불타는 애플", imageString: "https://cdn.e2news.com/news/photo/202301/249694_103455_5758.png")
     
    let dataBase = Firestore.firestore()
    
    init() {
        reservation = Reservation(userEmail: "", placeID: "", roomID: "", reservationState: 0, reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", hour: 1, personnel: 1, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservationCancelReason: "")
    }
    
    func changeDateString(_ date: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "MM / dd"
        return dateFormatter.string(from: date)
    }
    
    func getDateString(type: CheckDate, _ date: Date) -> String {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        
        switch type {
        case .year:
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
            
        case .month:
            dateFormatter.dateFormat = "MM"
            return dateFormatter.string(from: date)
            
        case .day:
            dateFormatter.dateFormat = "dd"
            return dateFormatter.string(from: date)
        }
    }
    
    func updateReservation<T> (type: ReservationCase, value: T) {
        switch type {
            
        case .reservationDate:
            if let dateValue = value as? Date {
                reservation.reservationYear = getDateString(type: .year, dateValue)
                reservation.reservationMonth = getDateString(type: .month, dateValue)
                reservation.reservationDay = getDateString(type: .day, dateValue)
            }
            
        case .checkInDate:
            if let dateValue = value as? Date {
                reservation.checkInYear = getDateString(type: .year, dateValue)
                reservation.checkInMonth = getDateString(type: .month, dateValue)
                reservation.checkInDay = getDateString(type: .day, dateValue)
            }
            
        case .checkOutDate:
            if let dateValue = value as? Date {
                reservation.checkOutYear = getDateString(type: .year, dateValue)
                reservation.checkOutMonth = getDateString(type: .month, dateValue)
                reservation.checkOutDay = getDateString(type: .day, dateValue)
            }

        case .hour:
            reservation.hour = value as! Int
            
        case .personnel:
            reservation.personnel = value as! Int
            
        case .reservationName:
            reservation.reservationName = value as! String
            
        case .reservationPhoneNumber:
            reservation.reservationPhoneNumber = value as! String
            
        case .reservationRequest:
            reservation.reservationRequest = value as! String
            
        default:
            print("not data")
        }
    }
    
    func getReservation (type: ReservationCase) -> String {
        
        switch type {
            
        case .reservationID:
            return "\(reservation.id)"
            
        case .reservationDate:
            return "\(reservation.reservationYear)년 \(reservation.reservationMonth)월 \(reservation.reservationDay)일"
            
        case .checkInDate:
            return "\(reservation.checkInYear)년 \(reservation.checkInMonth)월 \(reservation.checkInDay)일"
            
        case .checkOutDate:
            return "\(reservation.checkOutYear)년 \(reservation.checkOutMonth)월 \(reservation.checkOutDay)일"
            
        case .hour:
            return "\(reservation.hour)시간"
            
        case .personnel:
            return "\(reservation.personnel)명"
            
        case .reservationName:
            return reservation.reservationName
            
        case .reservationPhoneNumber:
            return reservation.reservationPhoneNumber.formatPhoneNumber()
            
        case .reservationRequest:
            return reservation.reservationRequest
            
        }
    }
    
    func addReservation() {
        dataBase.collection("Reservation").document(reservation.id)
            .setData(reservation.asDictionary())
        print("예약 추가 완료")
    }
    
    func fetchReservationRoom(roomID: String) {
        
        let docRef = dataBase.collection("Room").document(roomID)
        
        docRef.getDocument(as: ReservationRoom.self) { result in
            switch result {
            case .success(let room):
                self.reservationRoom = room
                
                self.reservation.roomID = roomID
                self.reservation.placeID = room.placeId
            case .failure(let error):
                print("Error decoding room: \(error)")
            }
        }
    }
    
    
    func fetchReservationAccount(sellerID: String) {
        
        let docRef = dataBase.collection("sellers").document(sellerID)
        
        docRef.getDocument() { (document, error) in
            if let document = document {
                let data = document.data()
                let account = data?["accountNumber"] as? String ?? "000000000"
                self.sellerAccount = account
            } else {
                print("Document does not exist in cache")
            }
        }
        
    }
    
    func getUserEmail(userId: String) {
        
        let docRef = dataBase.collection("users").document(userId)
        
        docRef.getDocument() { (document, error) in
            if let document = document {
                let data = document.data()
                let email = data?["email"] as? String ?? "none"
                self.reservation.userEmail = email
            } else {
                print("Document does not exist in cache")
            }
        }
    }
    
    func getReservationPrice() -> Int {
        
        var allPrice: Int = 0
        
        if let room = reservationRoom {
            
            if let lastDay = Int(reservation.checkOutDay), let firstDay = Int(reservation.checkInDay), let price = Int(room.price) {
                allPrice = (lastDay - firstDay + 1) * price * reservation.hour * reservation.personnel
            }
        }
        return allPrice
    }
}
