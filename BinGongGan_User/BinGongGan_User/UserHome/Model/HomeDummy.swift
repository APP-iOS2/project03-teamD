//
//  HomeDummy.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct HomeEventDummy: Identifiable {
    let id = UUID().uuidString
    let eventImage: String
    var imageURL: URL {
        URL(string: eventImage)!
    }
}

struct HomePlaceListDummy : Identifiable {
    let id = UUID().uuidString
    let placeName: String
    let placeString: String
    var imageURL: URL {
        URL(string: placeString)!
    }
}

struct PublicPlaceListDummy : Identifiable {
    let id = UUID().uuidString
    let placeName: String
    let placeLocation: String
    let placePrice: Int
    let placeString: String
    var imageURL: URL {
        URL(string: placeString)!
    }
    var isFavorite: Bool
}

final class DummyStore: ObservableObject {
    
    @Published var EventList: [HomeEventDummy] = [
        HomeEventDummy(eventImage: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad489f5287469802eca457586a25a096fd31" ),
        HomeEventDummy(eventImage: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad4882f3bd8c9735553d03f6f982e10ebe70" ),
        HomeEventDummy(eventImage: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad48f604e7b0e6900f9ac53a43965300eb9a" ),
        HomeEventDummy(eventImage: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad489f17e489affba0627eb1eb39695f93dd" ),
    ]
    
    var homePlaceList: [HomePlaceListDummy] = [
        HomePlaceListDummy(placeName: "공유 오피스",placeString: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad489f5287469802eca457586a25a096fd31"),
        HomePlaceListDummy(placeName: "밴드룸",placeString: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad4882f3bd8c9735553d03f6f982e10ebe70"),
        HomePlaceListDummy(placeName: "스튜디오",placeString: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad48f604e7b0e6900f9ac53a43965300eb9a"),
        HomePlaceListDummy(placeName: "공유 키친",placeString: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad489f17e489affba0627eb1eb39695f93dd"),
    ]
    
    @Published var publicPlaceList: [PublicPlaceListDummy] = [
        PublicPlaceListDummy(placeName: "유빈오피스", placeLocation: "강가구", placePrice: 12000, placeString: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad489f5287469802eca457586a25a096fd31", isFavorite: false),
        PublicPlaceListDummy(placeName: "제현오피스", placeLocation: "강나구", placePrice: 12000, placeString: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad4882f3bd8c9735553d03f6f982e10ebe70", isFavorite: false),
        PublicPlaceListDummy(placeName: "대진오피스", placeLocation: "강다구", placePrice: 12000, placeString: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad48f604e7b0e6900f9ac53a43965300eb9a", isFavorite: false),
        PublicPlaceListDummy(placeName: "하늘오피스", placeLocation: "강라구", placePrice: 12000, placeString: "https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad489f17e489affba0627eb1eb39695f93dd", isFavorite: false),
        PublicPlaceListDummy(placeName: "하늘오피스", placeLocation: "강마구", placePrice: 12000, placeString: "https://item.kakaocdn.net/do/a1ccece94b4ba1b47f0e5dbe05ce65689f5287469802eca457586a25a096fd31", isFavorite: false),
    ]
    
    static func backButton(_ string: String) -> some View {
        AsyncImage(url: URL(string: string), content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: ImageLogoConstant.width , height: ImageLogoConstant.height)
                .cornerRadius(15)
        }) {
            ProgressView()
        }
    }
}

