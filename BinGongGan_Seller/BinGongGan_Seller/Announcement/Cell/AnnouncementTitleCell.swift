//
//  AnnouncementTitleCell.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementTitleCell: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .bold()
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color.white)
        .background(Color.myBrown)
        .cornerRadius(15)

    }
}

struct AnnouncementTitleCell_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementTitleCell(title: "hi")
    }
}
