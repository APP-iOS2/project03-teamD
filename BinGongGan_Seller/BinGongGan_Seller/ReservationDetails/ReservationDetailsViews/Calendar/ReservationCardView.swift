//
//  ReservationCardView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import SwiftUI

struct ReservationCardView: View {
    
    @EnvironmentObject var rervationCalendarStore : RervationCalendarStore
    var value: DateValue
    @Binding var currentDate: Date
    var body: some View {
        VStack {
            
            if value.day != -1 {
                
                if let reservation = rervationCalendarStore.reservationData.first(where: { reservation in
                    return rervationCalendarStore.isSameDay(date1: reservation.reservationDate, date2: value.date)
                }) {
                    ZStack{
                        Text("\(value.day)")
                            .font(.title3.bold())
                            .foregroundColor(rervationCalendarStore.isSameDay(date1: reservation.reservationDate, date2: currentDate) ? .white : .primary)
                            .frame(maxWidth: .infinity)
                        if value.day < 10{
                            Circle()
                                .fill(rervationCalendarStore.isSameDay(date1: reservation.reservationDate, date2: currentDate) ? .white : Color.red )
                                .frame(width: 7, height: 7)
                                .offset(x:8,y:-10)
                        } else {
                            Circle()
                                .fill(rervationCalendarStore.isSameDay(date1: reservation.reservationDate, date2: currentDate) ? .white : Color.red )
                                .frame(width: 7, height: 7)
                                .offset(x:12,y:-10)
                        }
                    }
                    Spacer()
                    
                    Text("2")
                        .font(.body)
                        .foregroundColor(rervationCalendarStore.isSameDay(date1: reservation.reservationDate, date2: currentDate) ? .white : Color.gray )
                }else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(rervationCalendarStore.isSameDay(date1: value.date , date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }   
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
        
    }
    
}
struct ReservationCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCardView(value: DateValue(day: 1, date: Date()), currentDate: .constant(Date()))
    }
}
