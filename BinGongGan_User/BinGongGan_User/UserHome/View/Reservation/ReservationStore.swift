//
//  ReservationStore.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import Foundation

final class ReservationStore: ObservableObject {
    
    @Published var reservation: Reservation?
    
    let sampleSpace: SampleSpace = SampleSpace(spaceName: "[서울역] 갬성 파티룸", roomName: "202호 불타는 애플", imageString: "https://cdn.e2news.com/news/photo/202301/249694_103455_5758.png")
    
    let refundPolicy  = ["환불 불가", "환불 불가", "환불 불가", "환불 불가", "환불 불가", "총 금액의 80% 환불", "총 금액의 100% 환불", "총 금액의 100% 환불"]
    
    func changeDateString(_ date: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "MM / dd"
        return dateFormatter.string(from: date)
    }
    /*
    func setupCheckInOutDate(_ checkInOut: Double, date: Date) {
        checkInOut = date.timeIntervalSince1970
    }
     */
}


