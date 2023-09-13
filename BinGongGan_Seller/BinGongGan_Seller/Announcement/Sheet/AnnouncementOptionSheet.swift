//
//  AnnouncementOptionSheet.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementOptionSheet: View {
    var announcement: Announcement
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                AnnouncementOptionButton(announcementOption: AnnouncementOption.data[0], announcement: announcement)
                Spacer()
                AnnouncementOptionButton(announcementOption: AnnouncementOption.data[1], announcement: announcement)
                Spacer()
            }
            AnnouncementOptionCell()
        }
    }
}

