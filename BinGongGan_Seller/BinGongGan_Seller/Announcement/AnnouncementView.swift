//
//  AnnouncementView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//
import SwiftUI
import BinGongGanCore

struct AnnouncementView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var announcementStore: AnnouncementStore
    @State private var isAnnouncementViewLoading = false
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            VStack{
                HStack {
                    Text("공지 관리")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.myBrown)
                        .padding(.leading, 20)
                    Spacer()
                    NavigationLink {
                        AnnouncementAddView()
                            .environmentObject(announcementStore)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.myBrown)
                            .padding(.trailing, 20)
                    }
                }
                Form {
                    ForEach(announcementStore.roomInfoList, id: \.id) { roomAnnouncement in
                        Section(header: Text(roomAnnouncement.roomName)
                            .foregroundColor(Color.myBrown)
                        ) {
                            let announcements = announcementStore.announcementList.filter { $0.id == roomAnnouncement.id }.first?.announcements ?? []
                            if announcements.isEmpty {
                                Text("공지를 등록해주세요.")
                            } else {
                                ForEach(announcements.indices.reversed(), id: \.self) { index in
                                    NavigationLink {
                                        AnnouncementDetailView(announcement: announcements[index], roomInfo: roomAnnouncement)
                                    } label: {
                                        AnnouncementTextRow(index: index, announcement: announcements[index])
                                            .environmentObject(announcementStore)
                                            .background(Color.clear)
                                    }
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    Task {
                        await announcementStore.fetchRoomInfo()
                        await announcementStore.fetchRoomAnnouncement()
                    }
                }
                .background(Color.myBackground)
                .navigationBarBackButtonHidden(true)
                .scrollContentBackground(.hidden)
                .customBackbutton()
            }
        }
        .refreshable {
            await announcementStore.fetchRoomInfo()
            await announcementStore.fetchRoomAnnouncement()
        }
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView(announcementStore: AnnouncementStore())
    }
}
