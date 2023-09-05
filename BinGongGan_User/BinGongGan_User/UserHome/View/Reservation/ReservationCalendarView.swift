//
//  ReservationCalendarView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationCalendarView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    @State var checkinDate : Date = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker(
                "Start Date",
                selection: $checkinDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            
            Text("선택한 날짜")
            
            HStack {
                
            }
        }
    }
}

struct ReservationCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCalendarView()
    }
}
