//
//  HomeDummy.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum CategoryCase: String {
    case shareOffice = "공유 오피스"
    case bandRoom = "밴드룸"
    case studio = "스튜디오"
    case shareKitchen = "공유 주방"
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
    let category: CategoryCase
    var categoryName: String {
        return CategoryCase.RawValue()
    }
    let categoryImageString: String
    var imageURL: URL {
        URL(string: categoryImageString)!
    }
}

struct Place : Identifiable , Hashable {
    let id = UUID().uuidString
    var placeName: String
    let category: CategoryCase
    let placeLocation: String
    let placePrice: Int
    let placeString: String
    var imageURL: URL {
        URL(string: placeString)!
    }
    var isFavorite: Bool
}




