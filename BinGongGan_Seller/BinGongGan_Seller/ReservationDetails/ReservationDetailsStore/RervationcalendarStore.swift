//
//  RervationcalendarStore.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import Foundation


final class RervationCalendarStore : ObservableObject{
    
    @Published var reservationData = [ReservationCalendar]()
    
    init() {
        //더미데이터
//        reservationData.append(ReservationCalendar(reservationDetails: [ReservationCalendar.ReservationDetails(title: "공유 오피스")], reservationDate: self.stringtoDate(dateString: "2023-08-08 14:30:00")!))
//        reservationData.append(ReservationCalendar(reservationDetails: [ReservationCalendar.ReservationDetails(title: "공유 오피스")], reservationDate: Date()))
//        reservationData.append(ReservationCalendar(reservationDetails: [ReservationCalendar.ReservationDetails(title: "공유 오피스")], reservationDate: self.stringtoDate(dateString: "2023-09-10 14:30:00")!))
//        reservationData.append(ReservationCalendar(reservationDetails: [ReservationCalendar.ReservationDetails(title: "공유 오피스")], reservationDate: self.stringtoDate(dateString: "2023-09-13 14:30:00")!))
//        reservationData.append(ReservationCalendar(reservationDetails: [ReservationCalendar.ReservationDetails(title: "공유 오피스")], reservationDate: self.stringtoDate(dateString: "2023-10-13 14:30:00")!))
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate(currentDate: Date) -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth(_ currentMonth: Int) -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    
    func extractDate(currentMonth: Int) -> [DateValue] {
        
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth(currentMonth)
        
        var days = getAllDates(data: currentMonth).compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            let dateValue =  DateValue(day: day, date: date)
            return dateValue
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    func getAllDates(data:Date) -> [Date] {
        let calendar = Calendar.current
        
        if let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: data)),
           let range = calendar.range(of: .day, in: .month, for: startDate) {
            
            return range.compactMap { day -> Date? in
                return calendar.date(byAdding: .day, value: day - 1 , to: startDate)
            }
        } else {
            return []
        }
    }
    
    func stringtoDate(dateString: String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // 문자열의 형식과 일치하는 형식을 설정합니다.
        
        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
            debugPrint("날짜를 파싱할 수 없습니다.")
            return nil
            
        }
        
    }
    
    
}
