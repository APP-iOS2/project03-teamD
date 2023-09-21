//
//  RervationcalendarStore.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import SwiftUI
import Firebase
import FirebaseFirestore

final class RervationCalendarStore : ObservableObject{
    @Published var selectedType = ReservationStateType.waitReservation
    @Published var reservationData = [ReservationCalendar]()
    @Published var data = [SellerReservation]()
    @Published var groupedData = [String:[SellerReservation]]()
    @Published var canceldata = [SellerReservation]()
    @Published var waitldata = [SellerReservation]()
    @Published var confilmedldata = [SellerReservation]()
    let sellerUid = AuthStore.userUid
    let dbRef = Firestore.firestore().collection("Reservation")
    init() {
        Task {
            await fetchData()
        }
    }
    @MainActor func fetchData() async {
        let dbRef = Firestore.firestore().collection("Reservation")
        
        do {
            let snapshot = try await dbRef.getDocuments()
            
            self.data = try snapshot.documents.compactMap {
                try $0.data(as: SellerReservation.self)
            }
            
            filterData()
        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
    func filterData(){
        let mydata = data.filter { data in
            data.placeID == sellerUid
        }
        let sortedData = data.sorted {
            $0.reservationDateString > $1.reservationDateString
        }
        // 날짜를 키로 하는 Dictionary 생성
        var groupedElements: [String: [SellerReservation]] = [:]
        
        for element in mydata {
            if var existingElements = groupedElements[element.reservationDateString] {
                existingElements.append(element)
                groupedElements[element.reservationDateString] = existingElements
            } else {
                groupedElements[element.reservationDateString] = [element]
            }
        }
        groupedData = groupedElements
        for (date, items) in groupedElements {
            reservationData.append(ReservationCalendar(reservationCount: items.count, reservationDate: stringtoDate(dateString: date) ?? Date()))
        }
  
    }
    func reservationDate(currentDate:Date){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: currentDate)
        let data = groupedData.filter {
            $0.key == formattedDate
        }
        let datas = data.values
        var temp = [SellerReservation]()
        for i in datas{
            for j in i{
                temp.append(SellerReservation(id: j.id, userEmail: j.userEmail, roomID: j.roomID, reservationYear: j.reservationYear, reservationMonth: j.reservationMonth, reservationDay: j.reservationDay, checkInYear: j.checkInYear, checkInMonth: j.checkInMonth, checkInDay: j.checkInDay, checkOutYear: j.checkOutYear, checkOutMonth: j.checkOutMonth, checkOutDay: j.checkOutDay, placeID: j.placeID, hour: j.hour, personnel: j.personnel, reservationName: j.reservationName, reservationPhoneNumber: j.reservationPhoneNumber, reservationRequest: j.reservationRequest, reservationState: j.reservationState))
                
            }
        }

        let canceldata = temp.filter{
            $0.reservationState == 4
            //여기서 나온 값들 중에 최신값
        }
        self.canceldata = canceldata
        let waitldata = temp.filter{
            $0.reservationState == 0
        }
        self.waitldata = waitldata
        let confilmedldata = temp.filter{
            $0.reservationState == 1 || $0.reservationState == 2 || $0.reservationState == 3
        }
        self.confilmedldata = confilmedldata

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
        dateFormatter.dateFormat = "yyyy-MM-dd" // 문자열의 형식과 일치하는 형식을 설정합니다.
        
        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
            debugPrint("날짜를 파싱할 수 없습니다.")
            return nil
            
        }
        
    }
    
    
}
