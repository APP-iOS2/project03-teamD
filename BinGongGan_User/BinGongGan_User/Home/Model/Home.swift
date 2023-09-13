//
//  HomeDummy.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import FirebaseFirestoreSwift
import BinGongGanCore

enum CategoryCase: String {
    case shareOffice = "쉐어오피스"
    case bandRoom = "밴드룸"
    case studio = "스튜디오"
    case shareKitchen = "키친룸"
    case none
}

struct Event: Identifiable {
    let id = UUID().uuidString
    let eventImage: String
    var imageURL: URL {
        URL(string: eventImage)!
    }
}

struct Category : Identifiable {
    let id = UUID().uuidString
    let category: String
    let categoryImageString: String
    var imageURL: URL {
        URL(string: categoryImageString)!
    }
}


let eventImageArray: [String] = [
    "https://www.wolyo.co.kr/news/photo/201904/81998_50222_4657.png",
    "https://www.gvalley.co.kr/news/photo/202302/608488_79015_2725.jpg",
    "https://t1.daumcdn.net/cfile/tistory/9914E63B5B34D7B53C",
    "https://www.sisaweek.com/news/photo/201811/116056_99680_3841.png",
    "https://cdn.mc-plus.net/news/photo/202206/12444_35508_3057.jpg",
    "https://cdn.mc-plus.net/news/photo/202206/12444_35506_3056.jpg",
]
