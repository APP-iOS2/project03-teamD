//
//  MyPlaceView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/12.
//

import SwiftUI
import BinGongGanCore

struct MyPlaceView: View {
    @StateObject private var myPlaceStore: MyPlaceStore = MyPlaceStore()
    @StateObject var placeStore: PlaceStore = PlaceStore()
    @StateObject private var roomStore: RoomStore = RoomStore()
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            VStack {
                Section {
                    if let seller = myPlaceStore.seller {
                        SellerInformationCell(seller: seller)
                            .padding([.bottom, .leading, .trailing])
                    }
                } header: {
                    HStack {
                        Text("내 정보")
                            .padding([.top, .leading], 20)
                            .font(.head1Bold)
                        Spacer()
                    }
                }
                
                if placeStore.place?.id == "" {
                    NavigationLink {
                        PlaceAddView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                            
                            VStack {
                                Image(systemName: "plus.square.fill.on.square.fill")
                                    .font(.title)
                                    .padding(.bottom, 10)
                                Text("내 공간 추가하기")
                                    .font(.title3)
                            }
                            .foregroundColor(.gray)
                        }
                        .padding([.leading, .trailing], 20)
                    }
                } else {
                    Section {
                        GeometryReader { geometry in
                            let size = geometry.size
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 15) {
                                    ForEach(roomStore.rooms) { room in
                                        MySpaceCell(room: room)
                                            .overlay(alignment: .topTrailing) {
                                                Button {
                                                    roomStore.removeRoom(roomID: room.id)
                                                } label: {
                                                    Image(systemName: "xmark.circle.fill")
                                                        .resizable()
                                                        .frame(width: 30,height: 30)
                                                        .foregroundColor(.black)
                                                }
                                            }
                                            .frame(width: abs(size.width - 70), height: abs(size.width - 10))
                                    }
                                    NavigationLink {
                                        RoomAddView(roomStore: roomStore)
                                        
                                    } label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.white)
                                            
                                            VStack {
                                                Image(systemName: "plus.square.fill.on.square.fill").font(.title)
                                                    .padding(.bottom, 10)
                                                Text("새 공간 추가하기")
                                                    .font(.title3)
                                            }
                                            .foregroundColor(.gray)
                                        }
                                        
                                    }
                                    .frame(width: abs(size.width - 50), height: abs(size.width - 10))
                                }
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                            }
                        }
                    } header: {
                        HStack {
                            Text("내 방")
                                .padding([.top, .leading], 20)
                                .font(.head1Bold)
                            Spacer()
                        }
                    }
                }
            }.onAppear {
                placeStore.fetchPlace()
                roomStore.fetchRooms()
            }
        }
        .background(Color.myBackground)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("내 공간")
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .customBackbutton()
    }
}

struct MyPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPlaceView()
        }
    }
}
