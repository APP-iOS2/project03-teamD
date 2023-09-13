//
//  ReservationDetailsCalendarView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct ReservationDetailsCalendarView: View {
    
    @State var currentDate: Date = Date()
    @State private var isShowingWeekCalendar = false
    @State private var isPresentedModal: Bool = false
    private var rervationCalendarStore = RervationCalendarStore()
    
    var body: some View {
        VStack{
            ReservationDatePickerView(currentDate: $currentDate).environmentObject(rervationCalendarStore).padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15))
            Divider()
            ReservationDetailsSegmentView()
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 20))
            
            ForEach(0..<5) { index in
//                ReservationCell(isHiddenRightButton: true)
//                    .padding(.bottom, 12)
//                    .padding(.horizontal, 20)
            }
            Spacer()
        }
        .navigationTitle("예약관리")
        .navigationBarBackButtonHidden(true)
        .customBackbutton()
    }
        
}

struct ReservationDetailsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsCalendarView()
    }
}
