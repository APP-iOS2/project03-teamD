//
//  ReservationDetailsPickerView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationDetailsPickerView: View {
    @State private var selectedFlavor = DatePickerContent.today
    
    var body: some View {
        Picker("오늘", selection: $selectedFlavor) {
            Text("최근 한달").tag(DatePickerContent.lastMonth)
            Text("최근 일주일").tag(DatePickerContent.lastWeak)
            Text("오늘").tag(DatePickerContent.today)
        }
    }
}

struct ReservationDetailsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsPickerView()
    }
}
