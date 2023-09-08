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
            Divider()
                .padding(.bottom, 10)
            List {
                ForEach(AnnouncementOption.data[2..<4]) { announcementOption in
                    Button( action: {
                    }, label: {
                        Text(announcementOption.option)
                    })
                }
            }
            .listStyle(.plain)
        }
    }
}

struct AnnouncementOptionSheet_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementOptionSheet()
    }
}
