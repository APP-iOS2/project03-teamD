//
//  ReservationDetailsCalendarView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationDetailsCalendarView: View {
    
    @State private var selectedDate = Date()
    @State private var isShowingWeekCalendar = false
    @State private var isShowingModal: Bool = false
    
    var body: some View {
        DatePicker(
            "Start Date",
            selection: $selectedDate,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
        HStack{
            Text("확정대기")
                .font(.title3)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            Spacer()
        }
        ForEach(0..<5) { index in
            ReservationConfirmedCell(isShowingModal: $isShowingModal)
        }
        Spacer()
    }
}

struct ReservationDetailsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsCalendarView()
    }
}
