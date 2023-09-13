//
//  AnnouncementAddView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementAddView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var announcementStore: AnnouncementStore
    @State private var announcementTitle: String = ""
    @State private var announcementContent: String = ""
    @State private var isSelectedAllPlace: Bool = false
    @State private var isShowingAlert: Bool = false
    @State private var selectedPlace: String = "공간을 선택해주세요"
    @State private var selectedPlaces: [RoomAnnouncement] = []
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            ScrollView{
                HStack{
                    Text("공간 선택")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color.black)
                    Spacer()
                }
                .padding(.top, 10)
                
                HStack{
                    Picker(selection: $selectedPlace, label: Text("")) {
                        Text("공간을 선택해주세요").tag("")
                        ForEach(announcementStore.roomInfoList, id: \.id) { roomInfoList in
                            Text(roomInfoList.roomName)
                        }
                    }
                    .accentColor(Color.myBrown)
                    .padding(.leading, -10)
                    .disabled(isSelectedAllPlace)
                    Spacer()
                    Button {
                        isSelectedAllPlace.toggle()
                    } label: {
                        Text("전체 공간 선택").tag("")
                        Image(systemName: isSelectedAllPlace ? "checkmark.square" : "square")
                    }
                    .buttonStyle(.plain)
                }
                .padding(.bottom, 10)
                
                
                Group {
                    HStack{
                        Text("공지사항 제목")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    CustomTextField(maxLength: 20, placeholder: "공지 제목을 입력하세요", text: $announcementTitle)
                        .padding(.bottom, 10)
                }
                
                Group {
                    HStack{
                        Text("공지사항 입력")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    CustomTextEditor(maxLength: 400, text: $announcementContent)
                }
            }
            .padding(.horizontal, 20)
            
            VStack{
                Spacer()
                Button {
                    if isSelectedAllPlace {
                        selectedPlaces = announcementStore.roomInfoList
                        
                    } else if selectedPlace == "공간을 선택해주세요" {
                        isShowingAlert.toggle()
                        
                        return
                        
                    } else if let selectedRoomInfo = announcementStore.roomInfoList.first(where: { $0.id == selectedPlace }) {
                        selectedPlaces = [selectedRoomInfo]
                    }
                    
                    let newAnnouncement = Announcement(title: announcementTitle, content: announcementContent)
                    announcementStore.addAnnouncement(announcement: newAnnouncement, selectedPlaces: selectedPlaces)
                    dismiss()
                    
                } label: {
                    Text("등록하기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .bold()
                        .background(Color.myBrown)
                        .cornerRadius(15)
                }
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("공간을 선택해주세요."),
                    dismissButton: .default(Text("확인"))
                )
            }
            .padding(.horizontal, 20)
            .navigationTitle("공간 공지 등록")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .scrollContentBackground(.hidden)
            .customBackbutton()
        }
    }
}

struct AnnouncementAddView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementAddView()
            .environmentObject(AnnouncementStore())
        
    }
}
