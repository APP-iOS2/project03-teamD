//
//  ReservationDetailsSegmentViews.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/14.
//

import SwiftUI

struct ReservationDetailsSegmentViews: View {
    @EnvironmentObject private var rervationCalendarStore : RervationCalendarStore
       //TODO: sotre연결
    @State private var count = 0
    
    var body: some View {
        Picker("대기", selection: $rervationCalendarStore.selectedType) {
            ForEach(ReservationStateType.allCases){
                
                Text("\($0.rawValue)")
            }
        }
        .pickerStyle(.segmented)
    }
}

struct ReservationDetailsSegmentViews_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsSegmentViews()
    }
}
