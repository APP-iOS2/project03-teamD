//
//  RoomStore.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

class RoomStore: ObservableObject {
    @Published var room: Room = Room()
    @Published var rooms: [Room] = []
    let dataBase = Firestore.firestore().collection("Room")
    
    func addRoom(placeId: String, roomName: String, roomPrice: String, roomNote: String, imageNames: [String]) {
        room.placeId = placeId
        
        let newRoom: Room = Room(placeId: placeId, name: roomName, price: roomPrice, note: roomNote, imageNames: imageNames)    
        dataBase.document(newRoom.id)
            .setData(newRoom.asDictionary())
        print("방 추가 완료")
    }
    
    func updateRoom(roomId: String) {
        dataBase.document(room.id)
            .setData(room.asDictionary())
        print("방 추가 완료")
    }
    
    func fetchRooms() {
        dataBase.whereField("placeId", isEqualTo: "heewkwon").getDocuments { (document, error) in
            self.rooms = []
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                for document in document!.documents {
                    if let rooms = try? document.data(as: Room.self) {
                        self.rooms.append(rooms)
                    } else {
                        print("Error")
                    }
                }
            }
        }
    }
    
    func fetchRoom() {
        dataBase.whereField("placeId", isEqualTo: "heekwon").getDocuments { (document, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                for document in document!.documents {
                    if let room = try? document.data(as: Room.self) {
                        self.room = room
                    } else {
                        print("Error")
                    }
                }
            }
        }
    }
}
