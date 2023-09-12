//
//  HomeDummy.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import FirebaseFirestoreSwift

enum CategoryCase: String {
    case shareOffice = "공유오피스"
    case bandRoom = "밴드룸"
    case studio = "스튜디오"
    case shareKitchen = "공유주방"
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

struct Place : Identifiable, Hashable {
    var id = UUID().uuidString
    var placeName: String
    let category: String
    let placeLocation: String
    let placePrice: Int
    let imageString: String
    var imageURL: URL {
        URL(string: imageString)!
    }
    var isFavorite: Bool
}


let eventImageArray: [String] = [
    "https://media.discordapp.net/attachments/1148158635667632149/1149282476380934234/2023-09-07_6.58.09.png?width=1410&height=408",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282166413459536/2023-09-07_6.56.57.png?width=1410&height=402",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573181276170/canva---------Gpco5qgYLmU.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573550362666/canva--------BGJr497I-OM.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573881724979/canva----------mp-LcAtJ4yQ.jpg?width=1410&height=528",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282575689469993/canva--------zIbSUFxMP-c.jpg?width=1410&height=470",
]


