//
//  HomeStore.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI
//import FirebaseFirestoreSwift
//import FirebaseFirestore

final class HomeStore: ObservableObject {
    
    @Published var places: [Place] = []
    @Published var EventList: [Event] = []
    @Published var hotPlace: [Place] = []
    @Published var recommendPlace: [Place] = []
    @Published var filteredArray:[Place] = []
    @Published var recentlyWords: [String] = []
    @Published var cities: [City] = []
    
    @Published var selectedCategory: CategoryCase = .bandRoom
    @Published var selectSub: [String] = []
    //    let dbRef = Firestore.firestore().collection("Incruitments")
    
    var filteredCategoryCity: [Place] {
        return places.filter { place in
            selectSub.isEmpty ? place.category == selectedCategory : place.category == selectedCategory && selectSub.contains(place.placeLocation)
        }
    }
    
    var categories: [Category] = [
        Category(category: .shareOffice, categoryImageString:  "building.2"),
        Category(category: .bandRoom, categoryImageString:  "music.mic"),
        Category(category: .studio, categoryImageString:  "camera"),
        Category(category: .shareKitchen, categoryImageString:  "fork.knife"),
    ]
    
    init(){
        fetchPlace()
        settingEventBanner()
        settingHotPlace()
        settingRecommendPlace()
    }
    
    //    @MainActor
    //    func fetchPlaces() async throws -> Void {
    //      let snapshot = try await dbRef.getDocuments()
    //
    //      let places = snapshot.documents.compactMap({try? $0.data(as: Place.self) })
    //      self.places = places
    //    }
    
    func fetchPlace(){
        places = placeArray
        cities = cityArray
    }
    
    
    
    func searchPlaceName(placess: [Place] , keyWord: String) {
        
        filteredArray.removeAll()
        for place in placess {
            let key = keyWord.lowercased()
            let placeName = place.placeName.lowercased()
            let placeLocation = place.placeLocation.lowercased()
            if placeName.contains(key) || placeLocation.contains(key){
                filteredArray.append(place)
            }
        }
    }
    
    
    
    func settingEventBanner(){
        for i in eventImageArray.shuffled() {
            EventList.append(Event(eventImage: i))
        }
    }
    
    func settingHotPlace() {
        // 추후구현
        let temp: [Place] = places
        var count: Int = 0
        
        hotPlace.removeAll()
        for i in temp {
            if count == 4 {
                return
            }else{
                hotPlace.append(i)
                count += 1
            }
        }
    }
    
    func settingRecommendPlace() {
        var temp: [Place] = places
        var count: Int = 0
        temp.shuffle()
        recommendPlace.removeAll()
        for i in temp {
            if count == 4 {
                return
            }else{
                recommendPlace.append(i)
                count += 1
            }
        }
    }
    
    func changeFavorite(place: Place){
        if let index = places.firstIndex(where:{
            $0.id == place.id }) {
            places[index].isFavorite.toggle()
        }
    }
    
    func deleteRecentlyWord(word: String) {
        let index = recentlyWords.firstIndex {
            $0 == word
        }
        if let index {
            recentlyWords.remove(at: index)
        }
    }
    
    func searchRecentlyWord(word: String) {
        recentlyWords.append(word)
    }
    
}
