//
//  PlaceStore.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

class PlaceStore: ObservableObject {
    @Published var place = Place()
    @Published var placeList: [Place] = []
    
    let dataBase = Firestore.firestore().collection("Place")
    
    func addPlace(place: Place) {
        dataBase.document(place.id)
            .setData(place.asDictionary())
                print("장소 추가 완료")

        print("장소 추가 완료")
    }
    
    func fetchPlace() {
        dataBase.whereField("sellerId", isEqualTo: "판매자").getDocuments { (document, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                for document in document!.documents {
                    if let placeData = try? document.data(as: Place.self) {
                        self.place = placeData
                    } else {
                        print("Error")
                    }
                }
            }
        }

    }
    
//    func uploadImages(_ images: [UIImage]) {
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//
//        for (index, image) in images.enumerated() {
//            guard let imageData = image.jpegData(compressionQuality: 0.5) else {
//                continue
//            }
//
//            let imageName = UUID().uuidString
//            let imageRef = storageRef.child("images/\(imageName).jpg")
//
//            let _ = imageRef.putData(imageData, metadata: nil) { (_, error) in
//                if let error = error {
//                    print("Error uploading image \(index): \(error.localizedDescription)")
//                } else {
//                    print("Image \(index) uploaded successfully")
//                }
//            }
//        }
//    }
}
