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
    @Published var placeList: [Place] = []
    
    let dataBase = Firestore.firestore().collection("Place")
    
    func addPlace(place: Place) {
        dataBase.document(place.id)
            .setData(place.asDictionary())
                print("장소 추가 완료")
    }
}
