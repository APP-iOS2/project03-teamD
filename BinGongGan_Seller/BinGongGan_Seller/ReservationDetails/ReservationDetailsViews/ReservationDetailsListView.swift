//
//  ReservationDetailsListView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationDetailsListView: View {
   
    @State private var showModal: Bool = false
    
    var body: some View {
        
        VStack{
            HStack{
                Text("예약내역")
                    .font(.title)
                    .bold()
                Spacer()
                ReservationDetailsPickerView()
            }.padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            
            // /*
            HStack{
                Text("확정대기")
                    .font(.title3)
//                    .bold()
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                Spacer()
            }
            ForEach(0..<5) { index in
                ReservationConfirmedCell(showModal: $showModal)
            }
        }
        
    }
}
struct ReservationDetailsListView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsListView()
    }
}
