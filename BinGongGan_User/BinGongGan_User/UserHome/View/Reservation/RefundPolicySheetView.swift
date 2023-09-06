//
//  RefundPolicySheetView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/06.
//

import SwiftUI

struct RefundPolicySheetView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    var body: some View {
        // 환불규정
        Form {
            
            Section("환불 규정") {
                Text("환불 규정")
            }
            
        } // Form
    }
}

struct ReservationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RefundPolicySheetView()
            .environmentObject(ReservationStore())
    }
}
