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
import FirebaseStorage

@MainActor
final class HomeStore: ObservableObject {
    
    @Published var places: [Place] = []
    @Published var EventList: [Event] = []
    @Published var hotPlace: [Place] = []
    @Published var recommendPlace: [Place] = []
    @Published var filteredArray: [Place] = []
    @Published var recentlyWords: [String] = []
    @Published var cities: [City] = []
    @Published var selectedCategory: String = "band"
    @Published var selectSub: [String] = []
   
    var categories: [Category] = [
        Category(category: "공유오피스", categoryImageString:  "building.2"),
        Category(category: "밴드룸", categoryImageString:  "music.mic"),
        Category(category: "스튜디오", categoryImageString:  "camera"),
        Category(category: "공유주방", categoryImageString:  "cooktop"),
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
            places.removeAll()
            for document in querySnapshot.documents {
                
                let data = document.data()
                let sellerId: String = data["sellerId"] as? String ?? "sellerId"
                let placeName = data["placeName"] as? String ?? "placeName"
                let placeCategoryString = data["placeCategory"] as? String ?? "share"
                let placeCategory = PlaceCategory.fromRawString(placeCategoryString)
                let placeImageStringList: [String] = data["placeImageStringList"] as? [String] ?? [""]
                let note = data["note"] as? [String] ?? [""]
                let placeInfomationList =  data["placeInfomationList"] as? [String] ?? [""]
                
                let addressMap: [String: Any] = data["address"] as? [String: Any] ?? [:]
                let addressAddress = addressMap["address_name"] as? String ?? "addressAddress"
                let addressPlaceName = addressMap["placeName_name"] as? String ?? "placeName"
                let addressLongiture = addressMap["x"] as? String ?? "x"
                let addressLatitude = addressMap["y"] as? String ?? "y"
                
                let place = Place(
                    sellerId: sellerId,
                    placeName: placeName,
                    placeCategory: placeCategory,
                    placeImageStringList: placeImageStringList,
                    note: note,
                    placeInfomationList: placeInfomationList,
                    address: Address(
                        address: addressAddress,
                        placeName: addressPlaceName,
                        longitude: addressLongiture,
                        latitude: addressLatitude
                    )
                )
                if !places.contains(where: { fetchPlace in
                    fetchPlace.id == place.id
                }) {
                    tempStore.append(place)
                }
                
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
            
            return selectSub.isEmpty
            ? place.placeCategory.placeCategoryName == selectedCategory
            : place.placeCategory.placeCategoryName == selectedCategory && addressArray.contains(true)
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
            if !hotPlace.contains(where: { place in
                place.id == i.id
            }){
                if count == 4 {
                    return
                } else {
                    hotPlace.append(i)
                    count += 1
                }
            }
        }
    }
    
    func settingRecommendPlace() {
        var temp: [Place] = places
        var count: Int = 0
        temp.shuffle()
        
        recommendPlace.removeAll()
        for i in temp {
            if !recommendPlace.contains(where: { place in
                place.id == i.id
            }){
                if count == 4 {
                    return
                } else {
                    recommendPlace.append(i)
                    count += 1
                }
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
