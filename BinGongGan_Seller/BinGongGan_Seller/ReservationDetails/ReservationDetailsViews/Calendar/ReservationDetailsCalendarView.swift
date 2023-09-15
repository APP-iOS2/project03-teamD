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
    @EnvironmentObject private var rervationCalendarStore : RervationCalendarStore
//    @EnvironmentObject private var rervationStore : RervationStore
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ReservationDatePickerView(currentDate: $currentDate).environmentObject(rervationCalendarStore).padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15))
                Divider()
                ReservationDetailsSegmentViews()
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 20))
                    .environmentObject(rervationCalendarStore)
                switch rervationCalendarStore.selectedType{
                
                case .waitReservation :
                    ForEach(0..<rervationCalendarStore.waitldata.count, id: \.self) { index in
                        ReservationCells(data:rervationCalendarStore.waitldata[index],isHiddenRightButton: true)
                            .environmentObject(rervationCalendarStore)
                            .padding(.bottom, 12)
                            .padding(.horizontal, 20)
                    }
                case .cancelReservation :
                    ForEach(0..<rervationCalendarStore.canceldata.count, id: \.self) { index in
                        ReservationCells(data:rervationCalendarStore.canceldata[index],isHiddenRightButton: true)
                            .environmentObject(rervationCalendarStore)
                            .padding(.bottom, 12)
                            .padding(.horizontal, 20)
                    }
                case .confirmedReservation:
                    ForEach(0..<rervationCalendarStore.confilmedldata.count, id: \.self) { index in
                        ReservationCells(data:rervationCalendarStore.confilmedldata[index],isHiddenRightButton: true)
                            .environmentObject(rervationCalendarStore)
                            .padding(.bottom, 12)
                            .padding(.horizontal, 20)
                    }
                    
                }
                Spacer()
            }
        }
        .customBackbutton()
        .refreshable {
            Task{
                await rervationCalendarStore.fetchData()
            }
        }
        .navigationTitle("예약관리")
    }
    
}

struct ReservationDetailsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsCalendarView()
    }
}
