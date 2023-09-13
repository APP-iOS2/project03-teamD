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
import BinGongGanCore

@MainActor
final class HomeStore: ObservableObject {
    
    @Published var places: [Place] = []
    @Published var EventList: [Event] = []
    @Published var hotPlace: [Place] = []
    @Published var recommendPlace: [Place] = []
    @Published var filteredArray: [Place] = []
    @Published var recentlyWords: [String] = []
    @Published var cities: [City] = []
    @Published var selectedCategory: String = "밴드룸"
    @Published var selectSub: [String] = []
   
    var categories: [Category] = [
        Category(category: "쉐어오피스", categoryImageString:  "building.2"),
        Category(category: "밴드룸", categoryImageString:  "music.mic"),
        Category(category: "스튜디오", categoryImageString:  "camera"),
        Category(category: "키친룸", categoryImageString:  "cooktop"),
    ]
    
    let dbRef = Firestore.firestore().collection("Place")
    
    init() {
        cities = cityArray
        
        Task {
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
                let placeCategoryString = data["placeCategory"] as? String ?? "Share"
                let placeCategory = PlaceCategory.fromRawString(placeCategoryString)

                let place = Place(
                    sellerId: data["sellerId"] as? String ?? "sellerId",
                    placeName: data["placeName"] as? String ?? "placeName",
                    placeCategory: placeCategory,
                    placeImageStringList: data["placeImageStringList"] as? [String] ?? ["https://item.kakaocdn.net/do/c953abdde9169fee070a797b592dad489f5287469802eca457586a25a096fd31"],
                    note: data["note"] as? [String] ?? [""],
                    placeInfomationList: data["placeInfomationList"] as? [String] ?? [""],
                    address: Address(
                        address: addressMap["address_name"] as? String ?? "sellerId",
                        placeName: addressMap["placeName_name"] as? String ?? "placeName",
                        longitude: addressMap["x"] as? String ?? "x",
                        latitude: addressMap["y"] as? String ?? "y")
                )
                tempStore.append(place)
            }
            self.places = tempStore
        } catch {
            print("Error fetching Place: \(error)")
        }
    }

    var filteredCategoryCity: [Place] {
        return places.filter { place in
            let address = place.address.address.components(separatedBy: " ")
            var addressArray: [Bool] = []

            for i in address {
                if selectSub.contains(i) {
                    addressArray.append(true)
                }
            }
            return selectSub.isEmpty ? place.placeCategory.placeCategoryName == selectedCategory : place.placeCategory.placeCategoryName == selectedCategory && addressArray.contains(true)
        }
    }

    func searchPlaceName( keyWord: String) {

        filteredArray.removeAll()
        for place in places {
            let key = keyWord.lowercased()
            let placeName = place.placeName
            
            
            let placeLocation = place.address.address.lowercased()
            if placeName.contains(key) || placeLocation.contains(key) {
                filteredArray.append(place)
            }
        }
    }
    
    func settingEventBanner() {
        for i in eventImageArray.shuffled() {
            EventList.append(Event(eventImage: i))
        }
    }
    
    func settingHotPlace() {

        let temp: [Place] = places

        var count: Int = 0
        
        hotPlace.removeAll()
        for i in temp {
            if count == 4 {
                return
            } else {
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
            } else {
                recommendPlace.append(i)
                count += 1
            }
        }
    }
    
    func addRecentlyWord(word: String) {
        recentlyWords.append(word)
    }
    
    func deleteRecentlyWord(word: String) {
        if let index = recentlyWords.firstIndex(where: { $0 == word }) {
            recentlyWords.remove(at: index)
        }
    }
    
    @Published var mungImageCount: Int = 0
    @Published var mungText: [String] = ["고마워요.", "놀랐죠?", "이스터에그에요", "눌러줘서"]
    @Published var mungImage: [String] = ["mungmoongE4", "mungmoongE1", "mungmoongE2", "mungmoongE3"]
    
    func addMungCount() {
        if mungImageCount == mungImage.count - 1 {
            mungImageCount = 0
        } else {
            mungImageCount += 1
        }
    }
}
