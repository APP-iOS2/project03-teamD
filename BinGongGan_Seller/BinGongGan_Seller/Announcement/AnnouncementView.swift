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
    @State private var placeInfoList: [PlaceInfo] = []
    
    var body: some View {
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
                ForEach(placeInfoList) { placeInfo in
                    Section(header: Text(placeInfo.name)
                        .foregroundColor(Color.myBrown)
                    ) {
                        ForEach(announcementStore.announcementList.indices.reversed(), id: \.self) { index in
                            NavigationLink {
                                AnnouncementDetailView(announcement: announcementStore.announcementList[index])
                            } label: {
                                AnnouncementTextRow(index: index, announcement: announcementStore.announcementList[index])
                                    .environmentObject(announcementStore)
                                    .background(Color.clear)
                            }
                        }
                    }
                }
            }
        }
        .background(Color.myBackground)
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .customBackbutton()
    }
    
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView(announcementStore: AnnouncementStore())
    }
}
