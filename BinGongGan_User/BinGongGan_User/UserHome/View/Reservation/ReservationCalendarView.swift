//
//  ReservationCalendarView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationCalendarView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    @State private var dateRange: ClosedRange<Date>?
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            MultiDatePicker(dateRange:$dateRange, minDate: Date.now)
            
            Section("선택한 날짜") {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .frame(width: screenWidth - 30, height: 40)                    
                    if let range = dateRange {
                        HStack {
                            Text("입실 날짜: ")
                                .font(.footnote)
                            Text(reservationStore.changeDateString(range.lowerBound))
                                .bold()
                            
                            Spacer(minLength: 20)
                            
                            Text("퇴실 날짜: ")
                                .font(.footnote)
                            Text(reservationStore.changeDateString(range.upperBound))
                                .bold()
                        }
                        .padding([.leading,.trailing], 20)
                        
                    } else {
                        Text("날짜를 선택해주세요")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                }
            } // Section
            
            .padding(.top, 10)
            .padding(.leading, 20)
        }
    }
}

struct ReservationCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCalendarView()
    }
}
