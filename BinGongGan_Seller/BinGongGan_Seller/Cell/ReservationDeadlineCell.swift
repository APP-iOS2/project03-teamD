//
//  ReservationDeadlineCell.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/10.
//

import SwiftUI
import BinGongGanCore

struct ReservationDeadlineCell: View {
    var date : String
    var body: some View {
        Text("\(date)")
            .bold()
            .font(.subheadline)
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(Color.myBrown)
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}

struct ReservationDeadlineCell_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDeadlineCell(date: "")
    }
}
