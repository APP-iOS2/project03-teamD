//
//  ReservationDetailsCalendarView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationDetailsCalendarView: View {
    
    @State var currentDate: Date = Date()
    @State private var isShowingWeekCalendar = false
    @State private var isShowingModal: Bool = false
    private var rervationCalendarStore = RervationCalendarStore()
    
    var body: some View {
        VStack{
            ReservationDatePickerView(currentDate: $currentDate).environmentObject(rervationCalendarStore)
            ReservationDetailsSegmentView()
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            
            ForEach(0..<5) { index in
                ReservationCell()
                    .padding(.horizontal, 20)
            }
            Spacer()
        }.navigationTitle("예약관리")
    }
}

struct ReservationDetailsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsCalendarView()
    }
}
