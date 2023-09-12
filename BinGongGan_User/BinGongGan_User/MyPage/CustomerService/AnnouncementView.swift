//
//  AnnouncementView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List(Announcement.sampleAnnouncement) { announcement in
            NavigationLink {
                Text("\(announcement.content)")
            } label: {
                HStack {
                    Text("\(announcement.announcementType.rawValue)")
                        .font(.captionBold)
                    Text("\(announcement.title)")
                        .padding(.leading, -5)
                    Spacer()
                    Text("\(announcement.createdAt)")
                        .foregroundColor(.myMediumGray)
                }
                .font(.captionRegular)
            }
        }
        .padding(.top, -20)
        .background(Color.myBackground)
        .scrollContentBackground(.hidden)
        .navigationTitle("공지사항")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AnnouncementView()
        }
    }
}
