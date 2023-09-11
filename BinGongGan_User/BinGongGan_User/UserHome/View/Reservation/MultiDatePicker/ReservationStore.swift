//
//  ReservationStore.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import Foundation

enum ReservationCase {
    case reservationID
    case reservationDate
    case checkInDate
    case checkOutDate
    case hour
    case personnel
    case reservationName
    case reservationPhoneNumber
    case reservationRequest
}

enum CheckDate{
    case year
    case month
    case day
}

final class ReservationStore: ObservableObject {
    
    @Published var reservation: Reservation
    
    var isPolicyChecked: Bool = false
    
    let sampleSpace: SampleSpace = SampleSpace(spaceName: "[서울역] 갬성 파티룸", roomName: "202호 불타는 애플", imageString: "https://cdn.e2news.com/news/photo/202301/249694_103455_5758.png")
    
    init() {
        reservation = Reservation(userEmail: "", roomID: "", reservationID: "", reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", hour: 1, personnel: 1, reservationName: "", reservationPhoneNumber: "", reservationRequest: "")
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
            reservation.reservationYear = getDateString(type: .year, value as! Date)
            reservation.reservationMonth = getDateString(type: .month, value as! Date)
            reservation.reservationDay = getDateString(type: .day, value as! Date)
            
        case .checkInDate:
            reservation.checkInYear = getDateString(type: .year, value as! Date)
            reservation.checkInMonth = getDateString(type: .month, value as! Date)
            reservation.checkInDay = getDateString(type: .day, value as! Date)
            
        case .checkOutDate:
            reservation.checkOutYear = getDateString(type: .year, value as! Date)
            reservation.checkOutMonth = getDateString(type: .month, value as! Date)
            reservation.checkOutDay = getDateString(type: .day, value as! Date)
            
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
            return "\(reservation.reservationID)"
            
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
            return reservation.reservationPhoneNumber
            
        case .reservationRequest:
            return reservation.reservationRequest
            
        }
    }
}


