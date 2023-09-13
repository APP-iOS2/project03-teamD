//
//  RoomModifyView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore
import Combine

struct RoomModifyView: View {
    @EnvironmentObject var roomStore: RoomStore
    @State private var selectedImage: [UIImage] = []
    @State private var roomId: String = ""
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Group{
                        Text("방이름")
                        CustomTextField(placeholder: "방이름을 입력하세요", text: $roomStore.room.name)
                    }
                    
                    Group {
                        Text("공간 대여 가격")
                        HStack(spacing: 0) {
                            Text("시간 당")
                                .padding(.trailing, 5)
                                .foregroundColor(Color.myDarkGray)
                            
                            TextField("가격을 입력하세요", text: $roomStore.room.price)
                                .keyboardType(.decimalPad)
                                .onReceive(Just(roomStore.room.price)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.roomStore.room.price = filtered
                                    }
                                }
                                .overlay(alignment:.trailing) {
                                    Text("￦")
                                        .padding(.trailing, 1)
                                }
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    }
                    .padding(.top, 15)
                    
                    Group {
                        Text("방 상세사진")
                        PhotoSelectedView(selectedImages: $selectedImage, selectedImageNames: $roomStore.room.imageNames)
                    }
                    
                    Group{
                        Text("방 상세내용")
                        TextEditor(text: $roomStore.room.note)
                            .font(.body1Regular)
                            .frame(height: 300)
                            .cornerRadius(10)
                    }
                    PrimaryButton(title: "등록 하기") {
                        Task {
                            await roomStore.updateRoom(roomId: roomId)
                        }
                    }
                }
            }
            .onAppear {
                roomStore.fetchRoom()
                roomId = roomStore.room.id
            }
            .padding(20)
        }
        .customBackbutton()
        .navigationTitle("방 추가")
    }
}

struct RoomUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RoomModifyView()
                .environmentObject(RoomStore())
        }
    }
}
