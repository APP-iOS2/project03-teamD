//
//  HomeStore.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore
import Firebase

final class HomeStore: ObservableObject {
    
    @Published var places: [Place] = []
    @Published var EventList: [Event] = []
    @Published var hotPlace: [Place] = []
    @Published var recommendPlace: [Place] = []
    @Published var filteredArray:[Place] = []
    @Published var recentlyWords: [String] = []
    @Published var cities: [City] = []
    
    @Published var selectedCategory: String = "밴드룸"
    @Published var selectSub: [String] = []
    let dbRef = Firestore.firestore().collection("Place")
////
//    let db = Firestore.firestore()
    var filteredCategoryCity: [Place] {
        realfilteredCategoryCity()
    }
    func realfilteredCategoryCity () -> [Place] {
        
        return places.filter { place in
            let placetest = place.placeLocation.components(separatedBy: " ")
            var testBoll: [Bool] = []
            
                for i in placetest {
                    if selectSub.contains(i){
                        testBoll.append(true)
                    }
                }
            return selectSub.isEmpty ? place.category == selectedCategory : place.category == selectedCategory && testBoll.contains(true)
        }
    }
    
    var categories: [Category] = [
        Category(category: "쉐어오피스", categoryImageString:  "building.2"),
        Category(category: "밴드룸", categoryImageString:  "music.mic"),
        Category(category: "스튜디오", categoryImageString:  "camera"),
        Category(category: "쉐어키친", categoryImageString:  "fork.knife"),
    ]
    
    init() {
        Task{
            await fetchPlaces()
            cities = cityArray
            settingEventBanner()
            settingHotPlace()
            settingRecommendPlace()
        }
    }

    func fetchPlaces() async {
        
        do {
            var tempStore: [Place] = []
            let querySnapshot = try await dbRef.getDocuments()
            
            for document in querySnapshot.documents {
                let data = document.data()
                let addressMap: [String: Any] = data["address"] as? [String: Any] ?? [:]
                let placeImageStringList: [String] = data["placeImageStringList"] as? [String] ?? [""]
                let place = Place (
                    placeName: addressMap["place_name"] as? String ?? "",
                    category: data["placeCategory"] as? String ?? "",
                    placeLocation: addressMap["address_name"] as? String ?? "",
                    placePrice: data["place_Price"] as? Int ?? 16000,
                    imageString: placeImageStringList[0],
                    isFavorite: data["isFavorite"] as? Bool ?? false
                )
                tempStore.append(place)
            }
            self.places = tempStore
            
        } catch {
            print("Error fetching Place: (error)")
        }
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
