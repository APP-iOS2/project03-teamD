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
    
    func addRoom(placeId: String) {
        room.placeId = placeId
        dataBase.document(room.id)
            .setData(room.asDictionary())
        print("방 추가 완료")
    }
    
    func fetchRooms() {
        dataBase.getDocuments { (document, error) in
            self.rooms = []
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                for document in document!.documents {
                    if let rooms = try? document.data(as: Room.self) {
                        self.rooms.append(rooms)
                        print(self.rooms)
                    } else {
                        print("에러")
                    }
                }
            }
        }
    }
    
    
}
