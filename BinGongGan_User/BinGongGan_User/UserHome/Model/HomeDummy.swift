//
//  HomeDummy.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct HomeEventDummy: Identifiable {
    let id: UUID = UUID()
    let eventImage: Image
}

struct HomePlaceListDummy : Identifiable {
    let id: UUID = UUID()
    let placeName: String
    let placeImage: Image
}

final class DummyStore: ObservableObject {
    @Published var EventDummys: [HomeEventDummy] = [
        HomeEventDummy(eventImage: Image("dummyEventImage1")),
        HomeEventDummy(eventImage: Image("dummyEventImage2")),
        HomeEventDummy(eventImage: Image("dummyEventImage3")),
    ]
    @Published var PlaceDummys: [HomePlaceListDummy] = [
        HomePlaceListDummy(placeName: "공유 오피스", placeImage: Image("dummyPlaceImage1")),
        HomePlaceListDummy(placeName: "밴드룸", placeImage: Image("dummyPlaceImage2")),
        HomePlaceListDummy(placeName: "스튜디오", placeImage: Image("dummyPlaceImage3")),
        HomePlaceListDummy(placeName: "공유 키친", placeImage: Image("dummyPlaceImage4")),
    ]
}

