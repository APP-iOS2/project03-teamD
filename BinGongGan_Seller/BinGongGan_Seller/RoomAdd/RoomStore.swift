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
    let fireStoreService = FirestoreService()
    let dataBase = Firestore.firestore().collection("Room")
    
    func addRoom(room: Room, completion: @escaping () -> Void) async {
        do {
            try await fireStoreService.saveDocument(collectionId: .room, documentId: room.id, data: room)
        } catch {
            print("Error addRoom : \(error)")
        }
        completion()
    
        print("방 추가 완료")
    }
    
    func updateRoom(roomId: String) async {
        do {
           try await dataBase.document(roomId)
                .setData(room.asDictionary())
        } catch {
            print("Error addRoom : \(error)")
        }
    }
    
    func fetchRooms()  {
        
       
        do {
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
