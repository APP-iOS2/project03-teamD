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
                    ForEach(announcementStore.placeInfoList) { placeInfo in
                        Section(header: Text(placeInfo.name)
                            .foregroundColor(Color.myBrown)
                        ) {
                            let matchingAnnouncements = announcementStore.announcementList.filter { announcement in
                                announcement.places.contains { $0.name == placeInfo.name }
                            }
                            
                            if matchingAnnouncements.isEmpty {
                                Text("공지를 등록해주세요.")
                            } else {
                                ForEach(matchingAnnouncements.indices.reversed(), id: \.self) { index in
                                    NavigationLink {
                                        AnnouncementDetailView(announcement: matchingAnnouncements[index], placeInfo: placeInfo)
                                    } label: {
                                        AnnouncementTextRow(index: index, announcement: matchingAnnouncements[index])
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
                        await announcementStore.fetchPlaceInfo()
                        await announcementStore.fetchRoomAnnouncement()
                    }
                }
                .background(Color.myBackground)
                .navigationBarBackButtonHidden(true)
                .scrollContentBackground(.hidden)
                .customBackbutton()
            }
        }
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView(announcementStore: AnnouncementStore())
    }
}
