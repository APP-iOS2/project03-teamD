//
//  ReservationDatePickerView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct ReservationDatePickerView: View {
    @EnvironmentObject var rervationCalendarStore : RervationCalendarStore
    @Binding var currentDate: Date
    @State var  currentMonth: Int = 0
    let days = ["일", "월", "화", "수", "목", "금", "토"]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
   
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(rervationCalendarStore.extraDate(currentDate: currentDate)[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(rervationCalendarStore.extraDate(currentDate: currentDate)[1])
                        .font(.title.bold())
                }
                
                Spacer()
                Button {
                    currentMonth -= 1
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2 )
                }
                
                Button {
                    currentMonth += 1
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
                
                
            }
            .padding(.horizontal)
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: columns, spacing: 1) {
                ForEach(rervationCalendarStore.extractDate(currentMonth: currentMonth)) { value in
                    ReservationCardView(currentDate: $currentDate, value: value).environmentObject(rervationCalendarStore)
                        .background(
                            Circle()
                                .fill(Color.myMint)
                                .padding(3)
                                .offset(y:-9)
                                .opacity(rervationCalendarStore.isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                            rervationCalendarStore.reservationDate(currentDate: currentDate)
                        }
                }
            }
        }
        .onAppear{
            rervationCalendarStore.reservationDate(currentDate: currentDate)
        }
        .onChange(of: currentMonth) { newValue in
            currentDate = rervationCalendarStore.getCurrentMonth(currentMonth)
            rervationCalendarStore.reservationDate(currentDate: currentDate)
        }
    }
}

struct ReservationDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDatePickerView(currentDate: .constant(Date())).environmentObject(RervationCalendarStore())
    }
}
