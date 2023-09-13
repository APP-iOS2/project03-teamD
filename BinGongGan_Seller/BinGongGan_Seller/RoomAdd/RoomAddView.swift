//
//  RoomAddView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore
import Combine

struct RoomAddView: View {
    @Environment(\.dismiss) private var dismiss
    var roomStore: RoomStore
    
    @State private var selectedImage: [UIImage] = []
    @State private var roomName: String = ""
    @State private var roomPrice: String = ""
    @State private var roomNote: String = ""
    @State private var imageNames: [String] = []
    @State private var isShowingToast: Bool = false
    @State private var isDisabledButton: Bool = false
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Group{
                        Text("방이름")
                        CustomTextField(placeholder: "방이름을 입력하세요", text: $roomName)
                    }
                    
                    Group {
                        Text("공간 대여 가격")
                        HStack(spacing: 0) {
                            Text("시간 당")
                                .padding(.trailing, 5)
                                .foregroundColor(Color.myDarkGray)
                            
                            TextField("가격을 입력하세요", text: $roomPrice)
                                .keyboardType(.decimalPad)
                                .onChange(of: roomPrice, perform: { newValue in
                                    if newValue.count > 10 {
                                        roomPrice = String(newValue.prefix(10))
                                    }
                                })
                                .onReceive(Just(roomPrice)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.roomPrice = filtered
                                    }
                                }
                                .overlay(alignment:.trailing) {
                                    Text("원")
                                        .padding(.trailing, 1)
                                }
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    }
                    .padding(.top, 15)
                    
                    Section {
                        Text("방 상세사진")
                        PhotoSelectedView(selectedImages: $selectedImage, selectedImageNames: $imageNames)
                    }
                    
                    Section{
                        Text("방 상세내용")
                        TextEditor(text: $roomNote)
                            .font(.body1Regular)
                            .frame(height: 300)
                            .cornerRadius(10)
                    }
                    
                    AbledPrimaryButton(title: "등록 하기") {
                        isDisabledButton.toggle()
                        Task {
                            await roomStore.addRoom(
                                room:Room(placeId: AuthStore.userUid,
                                          name: roomName,
                                          price: roomPrice,
                                          note: roomNote,
                                          imageNames: imageNames),
                                images: selectedImage) {
                                    success in
                                    if success {
                                        isShowingToast = true
                                        isDisabledButton.toggle()
                                        dismiss()
                                    }
                                }
                        }
                    }
                    .disabled(isDisabledButton)
                }
            }
            .padding(20)
        }
        .toast(isShowing: $isShowingToast, message: "방 추가 완료")
        .customBackbutton()
        .navigationTitle("방 추가")
    }
}

struct RoomAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RoomAddView(roomStore: RoomStore())
        }
    }
}
