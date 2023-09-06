//
//  AnnouncementTextRow.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//
import SwiftUI
import BinGongGanCore

struct AnnouncementTextRow: View {

    var body: some View {
        HStack{
            Text("1")
                .padding(.trailing, 10)
            Text("이것은 제목입니다.")
            Spacer()
            Text("2023. 09. 05")
                .foregroundColor(Color.myMediumGray)
        }
        .foregroundColor(Color.myBlack)
    }
}

struct AnnouncementTextRow_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementTextRow()
    }
}
