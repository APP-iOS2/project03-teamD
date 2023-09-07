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
            
            VStack(alignment: .leading) {
                Text("선택한 날짜")
                    .font(.body1Regular)
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .frame(maxWidth: screenWidth * 0.9, minHeight: 40)
                    
                    if let range = dateRange {
                        HStack {
                            Text("입실 날짜: ")
                                .font(.captionRegular)
                            Text(reservationStore.changeDateString(range.lowerBound))
                                .font(.captionBold)
                            
                            Spacer()
                            
                            Text("퇴실 날짜: ")
                                .font(.captionRegular)
                            Text(reservationStore.changeDateString(range.upperBound))
                                .font(.captionBold)
                        }
                        .padding([.leading,.trailing], 20)
                        
                    } else {
                        Text("날짜를 선택해주세요")
                            .font(.captionRegular)
                            .foregroundColor(.gray)
                    }
                }
            }
            
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
