//
//  PlaceStore.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift


class PlaceStore: ObservableObject {
    @Published var place = Place()
    @Published var places: [Place] = []
    var ss: String = ""
    let dataBase = Firestore.firestore().collection("Place")
    
    func addPlace(place: Place) {
        dataBase.document(place.id)
            .setData(place.asDictionary())
        print("장소 추가 완료")
    }
    
    func fetchPlace() {
        dataBase.getDocuments { (document, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                for document in document!.documents {
                    if let placeData = try? document.data(as: Place.self) {
                        self.places.append(placeData)
                        print(self.places)
                    } else {
                        print("에러")
                    }
                }
            }
        }
    }
}


