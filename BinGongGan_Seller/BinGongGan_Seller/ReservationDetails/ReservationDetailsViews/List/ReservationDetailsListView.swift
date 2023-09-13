//
//  ReservationDetailsListView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationDetailsListView: View {
   
    @State private var isPresentedModal: Bool = false
    
    var body: some View {
        
        VStack{
            ReservationDetailsSegmentView()
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))

            ForEach(0..<5) { index in
//                ReservationCell(isHiddenRightButton: true)
//                    .padding(.bottom, 12)
//                    .padding(.horizontal, 20)
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
