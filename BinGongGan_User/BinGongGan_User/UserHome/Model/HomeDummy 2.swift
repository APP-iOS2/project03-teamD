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
        HomeEventDummy(eventImage: Image("dummyEventImage")),
        HomeEventDummy(eventImage: Image("dummyEventImage")),
        HomeEventDummy(eventImage: Image("dummyEventImage")),
    ]
    @Published var PlaceDummys: [HomePlaceListDummy] = [
        HomePlaceListDummy(placeName: "공유 오피스", placeImage: Image("dummyPlaceListImage")),
        HomePlaceListDummy(placeName: "밴드룸", placeImage: Image("dummyPlaceListImage")),
        HomePlaceListDummy(placeName: "스튜디오", placeImage: Image("dummyPlaceListImage")),
        HomePlaceListDummy(placeName: "공유 키친", placeImage: Image("dummyPlaceListImage")),
    ]
}

