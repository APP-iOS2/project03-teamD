//
//  ReservationCalendarView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationCalendarView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    @State var checkInDate : Date = Date()
    @State var checkOutDate : Date = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker(
                "Start Date",
                selection: $checkInDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            
            VStack(alignment: .listRowSeparatorLeading, spacing: 20) {
                Text("선택한 날짜")
                    .font(.title2)
                
                HStack {
                    Text("입실 날짜: ")
                    
                    Spacer()
                    
                    Text("퇴실 날짜: ")
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
