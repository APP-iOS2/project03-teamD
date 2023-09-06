//
//  ReservationCalendarView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationCalendarView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    //  @State private var checkInDate : Double = Date.timeIntervalSinceReferenceDate
    //  @State private var checkOutDate : Double = Date.timeIntervalSinceReferenceDate
    
    @State private var dateRange: ClosedRange<Date>? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            MultiDatePicker(dateRange:$dateRange, minDate: Date.now)
            
            VStack(alignment: .listRowSeparatorLeading, spacing: 20) {
                
                Text("선택한 날짜")
                    .font(.title3)
                
                if let range = dateRange {
                    HStack {
                        Text("입실 날짜: ")
                        Text(reservationStore.changeDateString(range.lowerBound))
                            .bold()
                    }
                    .font(.subheadline)
                    
                    HStack{
                        Text("퇴실 날짜: ")
                        Text(reservationStore.changeDateString(range.upperBound))
                            .bold()
                    }
                    .font(.subheadline)
                    
                } else {
                    Text("날짜를 선택해주세요")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
        }
    }
}

struct ReservationCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCalendarView()
    }
}
