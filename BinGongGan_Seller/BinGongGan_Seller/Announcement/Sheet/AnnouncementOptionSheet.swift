//
//  AnnouncementOptionSheet.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI

struct AnnouncementOptionSheet: View {

    var body: some View {
        VStack {
            HStack {
                Spacer()
                AnnouncementOptionButton(announcementOption: AnnouncementOption.data[0])
                Spacer()
                AnnouncementOptionButton(announcementOption: AnnouncementOption.data[1])
                Spacer()
            }
            AnnouncementOptionCell()
        }
    }
}

struct AnnouncementOptionSheet_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementOptionSheet()
    }
}
