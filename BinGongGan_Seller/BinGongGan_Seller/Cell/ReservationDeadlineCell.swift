//
//  ReservationDeadlineCell.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/10.
//

import SwiftUI
import BinGongGanCore

struct ReservationDeadlineCell: View {
    var body: some View {
        Text("3일 전")
            .bold()
            .font(.subheadline)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.myBrown)
            .foregroundColor(Color.white)
            .cornerRadius(15)
    }
}

struct ReservationDeadlineCell_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDeadlineCell()
    }
}
