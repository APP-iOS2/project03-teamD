//
//  PlaceStore.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseStorage

class PlaceStore: ObservableObject {
    @Published var place:Place? = Place()
    let dataBase = Firestore.firestore().collection("Place")
    
    func addPlace(place: Place, images: [UIImage]) async {
        var newPlace = place
        await uploadImages(images, place: newPlace) { urls in
            newPlace.placeImageStringList = urls
            self.dataBase.document(place.id)
                .setData(newPlace.asDictionary())
            print("장소 추가 완료")
        }
        fetchPlace()
    }

    func fetchPlace() {
        dataBase.whereField("sellerId", isEqualTo: AuthStore.userUid).getDocuments { (document, error) in
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
    
    func uploadImages(_ images: [UIImage],place: Place, completion: @escaping ([String]) -> Void) async {
        let storageRef = Storage.storage().reference()
        var urlStringList: [String] = []
        for (index, image) in images.enumerated() {
            guard let imageData = image.jpegData(compressionQuality: 0.1) else {
                continue
            }
            let imageRef = storageRef.child("place/\(place.id)/\(place.placeImageStringList[index])") //경로
            
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
