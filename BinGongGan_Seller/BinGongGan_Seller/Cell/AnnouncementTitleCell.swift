//
//  AnnouncementTitleCell.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/07.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementTitleCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("ABCD키친")
                .font(.title3)
                .bold()
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color.myWhite)
        .background(Color.myPrimary)
        .cornerRadius(15)

    }
}

struct AnnouncementTitleCell_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementTitleCell()
    }
}
