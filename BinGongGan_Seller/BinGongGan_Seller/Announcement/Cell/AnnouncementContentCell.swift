//
//  AnnouncementContentCell.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementContentCell: View {
    @State var isShowingAnnouncementOptionSheet: Bool = false
    @EnvironmentObject var announcementStore: AnnouncementStore
    var announcement: Announcement
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(announcement.title)
                    .fontWeight(.bold)
                Spacer()
                Button {
                    isShowingAnnouncementOptionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(Angle(degrees: 90))

                }
                .buttonStyle(.plain)
            }
            Divider()
            Spacer()
            HStack {
                Text("작성일 : \(announcementStore.formattedDate(from: announcement.date))")
                    .font(.subheadline)
            }
            .padding(.bottom, 20)
            HStack {
                Text(announcement.content)
            }
        }
        .padding()
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(15)
        .sheet(isPresented: $isShowingAnnouncementOptionSheet) {
            AnnouncementOptionSheet(announcement: announcement)
                .presentationDetents([.height(UIScreen.screenHeight * 0.37)])
                .presentationDragIndicator(.hidden)
        }
    }
}

