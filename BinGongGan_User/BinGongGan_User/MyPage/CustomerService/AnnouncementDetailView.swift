//
//  AnnouncementDetailView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/14.
//

import SwiftUI

struct AnnouncementDetailView: View {
    var announcement: Announcement
    var body: some View {
        Form {
            Section("공지 타입") {
                Text(announcement.announcementType.rawValue)
            }
            Section("제목") {
                Text(announcement.title)
            }
            Section("공지 내용") {
                Text(announcement.content)
            }
        }
        .padding(.top, -20)
        .navigationTitle("공지 내용")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct AnnouncementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AnnouncementDetailView(announcement: Announcement(title: "ssss", content: "askldfjklasdjflkasjmflkmxcvklvnmalknv\nasjkdhfjkasdnfjknaskdjf\nasdhfjkasdjkfnjaskfnk", announcementType: .notice, createdAt: "2023.09.13 수"))
        }
    }
}
