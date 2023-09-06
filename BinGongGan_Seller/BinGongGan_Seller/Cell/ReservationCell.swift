//
//  ReservationCell.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI

struct ReservationCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("#123456")
                .font(.title2)
                .bold()
            
            Text("ABCD키친")
                .font(.title3)
                .bold()
                .padding(.bottom, 4)
            
            Text("9월 13일 11:00 ~ 12:00")
                .font(.subheadline)
                .padding(.bottom, 20)
            
            Text("오영석 외 3명")
                .font(.subheadline)
            
            Text("30,000")
                .font(.subheadline)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.green)
        .cornerRadius(15)
        .padding([.leading, .trailing], 20)
        .padding(.bottom, 10)
    }
}

struct ReservationCell_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCell()
    }
}
