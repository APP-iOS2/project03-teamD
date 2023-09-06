//
//  PlaceModel.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/06.
//

import Foundation

struct PlaceModel: Identifiable {
    var id: UUID = UUID()
    var placeName: String
    var placePrice: String
    var placeCategory: String
    var placeAdress: String
    var placeImageStringList: [String]
    var informationToPass: String
    var placeInfomationList: [String]
}

enum PlaceCategory: String, CaseIterable, Identifiable {
    case 쉐어오피스, 밴드룸, 스튜디오, 키친룸
    var id: Self { self }
}

class PlaceStore: ObservableObject {
    @Published var placeList: [PlaceModel] = []
}
