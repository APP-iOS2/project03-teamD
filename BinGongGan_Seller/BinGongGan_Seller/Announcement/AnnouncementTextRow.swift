//  AnnouncementTextRow.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//
import SwiftUI
import BinGongGanCore

struct AnnouncementTextRow: View {
    var index: Int
    var announcement: Announcement
    @EnvironmentObject var announcementStore: AnnouncementStore
    
    var body: some View {
        HStack{
            Text("\(index + 1)")
                .padding(.trailing, 10)
            if announcement.title.count > 10 {
                Text(String(announcement.title.prefix(10)) + "..")
            } else {
                Text(announcement.title)
            }
            Spacer()
            Text(announcementStore.formattedDate(from: announcement.date))
                .foregroundColor(Color.myMediumGray)
        }
        .foregroundColor(.black)
    }
}

