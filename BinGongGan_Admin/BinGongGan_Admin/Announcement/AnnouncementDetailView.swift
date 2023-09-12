//
//  AnnouncementDetailView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct AnnouncementDetailView: View {
    var announcement: SystemAnnouncement
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
        .navigationTitle("공지 내용")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct AnnouncementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementDetailView(announcement: SystemAnnouncement(title: "제목", content: "맨어마ㅜ늘문ㄹ허ㅏㅜㅁㄴ허ㅏㅜㄹ마ㅣ너울머ㅏ누러ㅏ\n aslajsjklfnkajnj", announcementType: .notice, createdAt: "2023.09.13 수"))
    }
}
