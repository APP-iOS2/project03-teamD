//
//  AnnouncementListView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct AnnouncementListView: View {
    @StateObject private var announcementStore: AnnouncementStore = AnnouncementStore()
    var body: some View {
        VStack {
            List(announcementStore.announcementList) { announcement in
                NavigationLink {
                    AnnouncementDetailView(announcement: announcement)
                } label: {
                    HStack {
                        Text(announcement.announcementType.rawValue)
                        Text(announcement.title)
                    }
                }

            }
            NavigationLink{
                AddAnnouncementView(announcementStore: announcementStore)
            } label: {
                Text("공지 작성")
                    .buttonStyle(backgroundColor: .myBrown)
            }
        }
        .onAppear {
            Task {
                try await announcementStore.featchAnnouncement()
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct AnnouncementListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AnnouncementListView()
        }
    }
}
