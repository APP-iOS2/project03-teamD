//
//  AnnouncementDetailView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//
import SwiftUI
import BinGongGanCore

struct AnnouncementDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State var isShowingAnnouncementOptionSheet: Bool = false
    var announcement: Announcement
    var roomInfo: RoomAnnouncement
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            ScrollView {
                AnnouncementTitleCell(title: roomInfo.roomName)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                
                AnnouncementContentCell(announcement: announcement)
                    .environmentObject(AnnouncementStore())
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
            .navigationTitle("공지사항")
            .navigationBarTitleDisplayMode(.inline)
        }
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .customBackbutton()
    }
}

