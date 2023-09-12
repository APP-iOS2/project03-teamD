//
//  GongGanInfo.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI
import FirebaseFirestore

final class GongGanStore: ObservableObject {
    @Published var gongGanInfo: GongGan = GongGan.sampleGongGan
    @Published var isLoading: Bool = false
    
    var placeId: String = ""
    
    let dbRef = Firestore.firestore().collection("Place")
    
    func fetchMyInfo() {
        dbRef.document(placeId).getDocument { (document, error) in
            if let document = document, document.exists {
                let docData: [String: Any] = document.data() ?? [:]
                
                let placeName: String = docData["place_name"] as? String ?? ""
                let categoryName: String = docData["placeCategory"] as? String ?? ""
                let placePhone: String = docData["nickname"] as? String ?? ""
                
                let addressMap: [String: Any] = docData["address"] as? [String: Any] ?? [:]
                let placeLocation: String = addressMap["address_name"] as? String ?? ""
                
                let detailGongGan: [DetailGongGan] = docData["summary"] as? [DetailGongGan] ?? [DetailGongGan.sample]
                let placeImageUrl: [String] = docData["placeImageStringList"] as? [String] ?? [""]
                let placeInfo: [String] = docData["career"] as? [String] ?? [""]
                
                let placeGuideStrings: [String] = docData["placeGuide"] as? [String] ?? [""]
                var placeGuide: [PlaceGuide] = []
                for guideString in placeGuideStrings {
                    let guide = PlaceGuide(labelTitle: guideString)
                    placeGuide.append(guide)
                }
                
                let isFavorite: Bool = docData["career"] as? Bool ?? false
                
                let info = GongGan(placeName: placeName, categoryName: categoryName, placePhone: placePhone, placeLocation: placeLocation, detailGongGan: detailGongGan, placeImageUrl: placeImageUrl, placeInfo: placeInfo, placeGuide: placeGuide, isFavorite: isFavorite)
                
                self.gongGanInfo = info
            }
        }
    }
    
}
final class MyFavoriteStore: ObservableObject {
    @Published var myFavoriteGongGan : [GongGan] = [
        GongGan.sampleGongGan,
        GongGan.sampleGongGan,
        GongGan.sampleGongGan,
        GongGan.sampleGongGan,
        GongGan.sampleGongGan,
    ]
    
}

