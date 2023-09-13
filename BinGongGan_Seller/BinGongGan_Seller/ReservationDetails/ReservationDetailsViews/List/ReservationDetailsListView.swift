//
//  ReservationDetailsListView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationDetailsListView: View {
   
    @State private var isPresentedModal: Bool = false
    @EnvironmentObject private var rervationStore : RervationStore
    var body: some View {
        
        VStack{
            ReservationDetailsSegmentView()
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            switch rervationStore.selectedType{
            case .waitReservation :
                ForEach(0..<rervationStore.waitldata.count, id: \.self) { index in
                    ReservationCell(data:rervationStore.waitldata[index],isHiddenRightButton: true)
                        .environmentObject(rervationStore)
                        .padding(.bottom, 12)
                        .padding(.horizontal, 20)
                }
            case .cancelReservation :
                ForEach(0..<rervationStore.canceldata.count, id: \.self) { index in
                    ReservationCell(data:rervationStore.canceldata[index],isHiddenRightButton: true)
                        .environmentObject(rervationStore)
                        .padding(.bottom, 12)
                        .padding(.horizontal, 20)
                }
            case .confirmedReservation:
                ForEach(0..<rervationStore.confilmedldata.count, id: \.self) { index in
                    ReservationCell(data:rervationStore.confilmedldata[index],isHiddenRightButton: true)
                        .environmentObject(rervationStore)
                        .padding(.bottom, 12)
                        .padding(.horizontal, 20)
                }
            
            }
            
        }
        .navigationTitle("예약관리")
    }
}
struct ReservationDetailsListView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsListView()
    }
}
