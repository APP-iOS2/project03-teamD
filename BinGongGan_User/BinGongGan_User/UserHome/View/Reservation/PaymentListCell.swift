//
//  PaymentListCell.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/07.
//

import SwiftUI

struct PaymentListCell: View {
    
    let title: String
    let data: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.body1Regular)
                .frame(width: 80)
            Divider()
            
            Text("reservationStore.reservation.\(data)")
        }
    }
}

struct PaymentListCell_Previews: PreviewProvider {
    static var previews: some View {
        PaymentListCell(title: "신청일", data: "아마 오늘?")
    }
}
