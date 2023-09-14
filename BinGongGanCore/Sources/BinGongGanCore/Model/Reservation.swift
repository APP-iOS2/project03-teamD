//
//  File.swift
//  
//
//  Created by 민근의 mac on 2023/09/12.
//

import Foundation
import FirebaseFirestoreSwift
 
public struct Reservation: Identifiable, Codable {
    public var id: String
    public var userEmail: String
    
    public var roomID: String
    public var placeID: String
//    public var sellerID: String
    
    public var reservationYear: String
    public var reservationMonth: String
    public var reservationDay: String
    
    public var reservationDateString: String {
        return "\(reservationYear)/\(reservationMonth)/\(reservationDay)"
    }
    
    public var checkInYear: String
    public var checkInMonth: String
    public var checkInDay: String
    
    public var checkInDateString: String {
        return "\(checkInYear)/\(checkInMonth)/\(checkInDay)"
    }
    
    public var checkOutYear: String
    public var checkOutMonth: String
    public var checkOutDay: String
    
    public var checkOutDateString: String {
        return "\(checkOutYear)/\(checkOutMonth)/\(checkOutDay)"
    }
    
    public var hour: Int
    public var personnel: Int
    
    public var reservationName: String
    public var reservationPhoneNumber: String
    public var reservationRequest: String
    public var reservationState: Int
    public var reservateStringCase: ReservationHistoryType {
        get {
            switch reservationState {
            case 0 : return .expect
            case 1 : return .expect
            case 2 : return .success
            case 3 : return .success
            case 4 : return .cancel
            default : return .expect
            }
            
        }
    }
    
    public var place: Place? = nil
    public var room: Room? = nil
    public var seller: Seller? = nil
    public var bankName: String? = nil
    public init(id: String, userEmail: String, roomID: String, placeID: String, reservationYear: String, reservationMonth: String, reservationDay: String, checkInYear: String, checkInMonth: String, checkInDay: String, checkOutYear: String, checkOutMonth: String, checkOutDay: String, hour: Int, personnel: Int, reservationName: String, reservationPhoneNumber: String, reservationRequest: String, reservationState: Int) {
        self.id = id
        self.userEmail = userEmail
        self.roomID = roomID
        self.placeID = placeID
//        self.sellerID = sellerID
        self.reservationYear = reservationYear
        self.reservationMonth = reservationMonth
        self.reservationDay = reservationDay
        self.checkInYear = checkInYear
        self.checkInMonth = checkInMonth
        self.checkInDay = checkInDay
        self.checkOutYear = checkOutYear
        self.checkOutMonth = checkOutMonth
        self.checkOutDay = checkOutDay
        self.hour = hour
        self.personnel = personnel
        self.reservationName = reservationName
        self.reservationPhoneNumber = reservationPhoneNumber
        self.reservationRequest = reservationRequest
        self.reservationState = reservationState
    }
}

public enum ReservationHistoryType: String , CaseIterable {
    case all = "전체 내역"
    case expect = "예정 내역"
    case success = "완료 내역"
    case cancel = "취소 내역"
}
