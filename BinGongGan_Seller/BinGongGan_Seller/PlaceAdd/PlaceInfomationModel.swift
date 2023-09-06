//
//  PlaceInfomationModel.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/06.
//

import Foundation
import SwiftUI

struct PlaceInfomationModel: Identifiable {
    var id = UUID()
    var name: String
    var imageString: String
    var isSelected: Bool
    
    static let data = [
        PlaceInfomationModel(name: "와이파이", imageString: "wifi", isSelected: false),
        PlaceInfomationModel(name: "주차장", imageString: "parkingsign",isSelected: false),
        PlaceInfomationModel(name: "반려동물", imageString: "pawprint.fill", isSelected: false),
        PlaceInfomationModel(name: "냉난방시설", imageString: "air.conditioner.horizontal", isSelected: false),
        PlaceInfomationModel(name: "화재경보기", imageString: "flame.fill", isSelected: false),
        PlaceInfomationModel(name: "소화기", imageString: "person", isSelected: false),
        PlaceInfomationModel(name: "엘리베이터", imageString: "door.sliding.left.hand.closed",isSelected: false),
        PlaceInfomationModel(name: "흡연실", imageString: "smoke",isSelected: false),
    ]
}
