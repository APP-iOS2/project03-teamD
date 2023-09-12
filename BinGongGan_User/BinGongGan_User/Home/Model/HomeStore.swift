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

@MainActor
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
    var categories: [Category] = [
        Category(category: "쉐어오피스", categoryImageString:  "building.2"),
        Category(category: "밴드룸", categoryImageString:  "music.mic"),
        Category(category: "스튜디오", categoryImageString:  "camera"),
        Category(category: "쉐어키친", categoryImageString:  "cooktop"),
    ]
    
    let dbRef = Firestore.firestore().collection("Place")
    
    init() {
        places.append(demoPlace)
        cities = cityArray
        
        Task{
            await fetchPlaces()
            settingHotPlace()
            settingEventBanner()
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
    
    var filteredCategoryCity: [Place] {
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
    
    func changeFavorite(place: Place){
        if let index = places.firstIndex(where:{
            $0.id == place.id }) {
            places[index].isFavorite.toggle()
        }
    }
    
    // setting
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
    
    // Recently
    func addRecentlyWord(word: String) {
        recentlyWords.append(word)
    }
    func deleteRecentlyWord(word: String) {
        let index = recentlyWords.firstIndex {
            $0 == word
        }
        if let index {
            recentlyWords.remove(at: index)
        }
    }
    
    
    @Published var mungImageCount: Int = 0
    @Published var mungText: [String] = ["고마워요.","놀랐죠?" , "이스터에그에요", "눌러줘서" ]
    @Published var mungImage: [String] = ["mungmoongE4", "mungmoongE1","mungmoongE2","mungmoongE3"]
    func addMungCount() {
        if mungImageCount == 3 {
            mungImageCount = 0
        } else {
            mungImageCount += 1
        }
    }
}

let demoPlace = Place(placeName: "나는데모긴글자테스트용", category: "쉐어오피스", placeLocation: "서울시 강서구 화곡동 일공칠구-10", placePrice: 1, imageString: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9JQXtDMPHZnD0bBgTODPgX_HmUZzlusBQ9kEPtkYwJg&s", isFavorite: false)
