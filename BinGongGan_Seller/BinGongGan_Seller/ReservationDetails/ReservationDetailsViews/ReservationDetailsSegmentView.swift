//
//  ReservationDetailsSegmentView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/07.
//

import SwiftUI

enum ReservationStateType: String, CaseIterable, Identifiable {
    case waitReservation = "대기"
    case cancelReservation = "취소"
    case confirmedReservation = "확정"
    
    var id: Self { self }
}

struct ReservationDetailsSegmentView: View {
    @State private var selectedType = ReservationStateType.waitReservation     //TODO: sotre연결
    @State private var count = 0
    
    var body: some View {
        Picker("대기", selection: $selectedType) {
            ForEach(ReservationStateType.allCases){
                Text("\($0.rawValue) \(count) 건").tag($0.hashValue)
            }
        }
        .pickerStyle(.segmented)
    }
}

struct ReservationDetailsSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsSegmentView()
    }
}
