
//
//  DetailAnnouncementView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/12.
//

import SwiftUI

import BinGongGanCore
struct Announcement1: Identifiable {
    let id: UUID = UUID()
    let title: String
    let content: String
    let announcementType: AnnouncementType1
    let createdAt: String
}

extension Announcement1 {
    static let sampleAnnouncement: [Announcement1] = [
        Announcement1(title: "빈공간 ver 1.0.2 업데이트", content: "새로운 버전이 업데이트 됐습니다.", announcementType: .update, createdAt: "2023-09-05"),
        Announcement1(title: "빈공간 앱 출시!", content: "드디어 출시 됐습니다.", announcementType: .notice, createdAt: "2023-09-05"),
        Announcement1(title: "결제 오류", content: "드디어 출시 됐습니다.", announcementType: .error, createdAt: "2023-09-04"),
    ]
}
enum AnnouncementType1: String {
    case notice = "[공지]"
    case update = "[업데이트]"
    case error = "[장애]"
}
struct DetailAnnouncementView: View {
    @Environment(\.dismiss) private var dismiss
    private let screenWidth = UIScreen.main.bounds.width
    private let screenheight = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            ForEach(Announcement1.sampleAnnouncement) { announcement in
                NavigationLink {
                    Text("\(announcement.content)")
                        .customBackbutton()
                } label: {
                    VStack {
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
                    .padding(.vertical, 10)
                }
            }
            .background(Color.myBackground)
        }
        .frame(width: screenWidth * 0.95)
    }
        
}

struct DetailAnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailAnnouncementView()
        }
    }
}
