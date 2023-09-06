//
//  HomeDummy.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct HomeEventDummy: Identifiable {
    let id = UUID().uuidString
    let eventImage: Image
}

struct HomePlaceListDummy : Identifiable {
    let id = UUID().uuidString
    let placeName: String
    let placeImage: Image
}

struct PublicPlaceListDummy : Identifiable {
    let id = UUID().uuidString
    let placeName: String
    let placeLocation: String
    let placePrice: Int
    let placeImage: Image
    var isFavorite: Bool
}

final class DummyStore: ObservableObject {
    
    @Published var EventList: [HomeEventDummy] = [
        HomeEventDummy(eventImage: Image("brownDog1")),
        HomeEventDummy(eventImage: Image("brownDog2")),
        HomeEventDummy(eventImage: Image("brownDog3")),
        HomeEventDummy(eventImage: Image("brownDog4")),
        
    ]
    
    var homePlaceList: [HomePlaceListDummy] = [
        HomePlaceListDummy(placeName: "공유 오피스", placeImage: Image("dog1")),
        HomePlaceListDummy(placeName: "밴드룸", placeImage: Image("dog2")),
        HomePlaceListDummy(placeName: "스튜디오", placeImage: Image("dog3")),
        HomePlaceListDummy(placeName: "공유 키친", placeImage: Image("dog4")),
    ]
    
    @Published var publicPlaceList: [PublicPlaceListDummy] = [
        PublicPlaceListDummy(placeName: "유빈오피스", placeLocation: "강가구", placePrice: 12000, placeImage: Image("dog1"), isFavorite: false),
        PublicPlaceListDummy(placeName: "하늘오피스", placeLocation: "강나구", placePrice: 10000, placeImage: Image("dog2"), isFavorite: false),
        PublicPlaceListDummy(placeName: "성혜오피스", placeLocation: "강다구", placePrice: 8000, placeImage: Image("dog3"), isFavorite: false),
        PublicPlaceListDummy(placeName: "대진오피즈", placeLocation: "강라구", placePrice: 6000, placeImage: Image("dog4"), isFavorite: false),
        PublicPlaceListDummy(placeName: "지호오피스", placeLocation: "강마구", placePrice: 12000, placeImage: Image("dog5"), isFavorite: false),
        PublicPlaceListDummy(placeName: "제현오피스", placeLocation: "강바구", placePrice: 10000, placeImage: Image("dog6"), isFavorite: false),
        PublicPlaceListDummy(placeName: "윤호오피스", placeLocation: "강사구", placePrice: 8000, placeImage: Image("dog7"), isFavorite: false),
        PublicPlaceListDummy(placeName: "영석오피즈", placeLocation: "강아구", placePrice: 6000, placeImage: Image("dog8"), isFavorite: false),
    ]
}

