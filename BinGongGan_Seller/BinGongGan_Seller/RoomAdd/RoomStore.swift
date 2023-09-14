//
//  RoomStore.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseStorage


class RoomStore: ObservableObject {
    @Published var room: Room = Room()
    @Published var rooms: [Room] = []
    private let dataBase = Firestore.firestore().collection("Room")
    
    func addRoom(room: Room, images: [UIImage], completion: @escaping (Bool) -> ()) async {
        var newRoom = room
        await uploadImages(images, room: newRoom) { urls in
            newRoom.imageNames = urls
            self.dataBase.document(newRoom.id)
                .setData(newRoom.asDictionary())
            completion(true)
        }
        fetchRooms()
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
    
    func fetchRooms() {
        do {
            dataBase.whereField("placeId", isEqualTo: AuthStore.userUid).getDocuments { (document, error) in
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
        dataBase.whereField("placeId", isEqualTo: AuthStore.userUid).getDocuments { (document, error) in
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
    
    func removeRoom(roomID: String) {
        dataBase.document(roomID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
                self.fetchRooms()
            }
        }
    }
    
    func uploadImages(_ images: [UIImage],room: Room, completion: @escaping ([String]) -> Void) async {
        let storageRef = Storage.storage().reference()
        var urlStringList: [String] = []
        for (index, image) in images.enumerated() {
            guard let imageData = image.jpegData(compressionQuality: 0.1) else {
                continue
            }
            let imageRef = storageRef.child("Room/\(room.id)/\(room.imageNames[index])") //경로
            
            let _ = imageRef.putData(imageData, metadata: nil) { (_, error) in
                if let error = error {
                    print("Error uploading image \(index): \(error.localizedDescription)")
                } else {
                    imageRef.downloadURL { url, error in
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            urlStringList.append(url?.absoluteString ?? "")
                            if urlStringList.count == images.count {
                                completion(urlStringList)
                            }
                        }
                        print("Image \(index) uploaded successfully")
                    }
                }
            }
        }
    }
}
