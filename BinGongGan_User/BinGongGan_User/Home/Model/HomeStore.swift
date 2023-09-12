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
    

    // MARK: - Published Properties
    
    @Published var places: [Place] = [] // 장소 목록
    @Published var EventList: [Event] = [] // 이벤트 목록
    @Published var hotPlace: [Place] = [] // 인기 장소 목록
    @Published var recommendPlace: [Place] = [] // 추천 장소 목록
    @Published var filteredArray: [Place] = [] // 필터링된 장소 목록
    @Published var recentlyWords: [String] = [] // 최근 검색어 목록
    @Published var cities: [City] = [] // 도시 목록
    @Published var selectedCategory: String = "밴드룸" // 선택된 카테고리
    @Published var selectSub: [String] = [] // 선택된 서브 카테고리 목록
    
    // MARK: - Other Properties
    
    var categories: [Category] = [
        Category(category: "쉐어오피스", categoryImageString:  "building.2"),
        Category(category: "밴드룸", categoryImageString:  "music.mic"),
        Category(category: "스튜디오", categoryImageString:  "camera"),
        Category(category: "키친룸", categoryImageString:  "cooktop"),
    ]
    
    let dbRef = Firestore.firestore().collection("Place")
    
    // MARK: - Initializer
    
    init() {
        cities = cityArray
        
        Task {
            await fetchPlaces()
            settingHotPlace()
            settingEventBanner()
            settingRecommendPlace()
        }
    }
  
    // MARK: - Async Functions
    func fetchPlaces() async {
        do {
            var tempStore: [GongGanPlace] = []
            let querySnapshot = try await dbRef.getDocuments()

            for document in querySnapshot.documents {
                let data = document.data()
                let addressMap: [String: Any] = data["address"] as? [String: Any] ?? [:]


                
                let placeCategoryString = data["placeCategory"] as? String ?? "Share"
                let placeCategory = PlaceCategory.fromRawString(placeCategoryString)

                let place = Place(
                    sellerId: data["sellerId"] as? String ?? "sellerId",
                    placeName: data["placeName"] as? String ?? "placeName",
                    placeCategory: placeCategory, // 변환한 열거형을 사용
                    placeImageStringList: data["placeImageStringList"] as? [String] ?? [""],
                    note: data["note"] as? [String] ?? [""],
                    placeInfomationList: data["placeInfomationList"] as? [String] ?? [""],
                    address: Address(
                        address: addressMap["address_name"] as? String ?? "sellerId",
                        placeName: addressMap["placeName_name"] as? String ?? "placeName",
                        longitude: addressMap["x"] as? String ?? "x",
                        latitude: addressMap["y"] as? String ?? "x")

                )
                print(place.placeCategory)
                tempStore.append(place)
            }
            self.places = tempStore
        } catch {

            print("Error fetching Place: \(error)")
        }
    }

    // MARK: - Filtering Functions

    var filteredCategoryCity: [Place] {
        return places.filter { place in
            let placetest = place.address.address.components(separatedBy: " ") // 주소 정보를 사용합니다.
            var testBoll: [Bool] = []

            for i in placetest {
                if selectSub.contains(i) {
                    testBoll.append(true)
                }
            }

            return selectSub.isEmpty ? place.placeCategory.placeCategoryName == selectedCategory : place.placeCategory.placeCategoryName == selectedCategory && testBoll.contains(true)
            
        }
    }

    // MARK: - Search Function

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
    

    // MARK: - Event and Recommendation Functions

    
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
        var temp: [GongGanPlace] = places
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
    
    // MARK: - Recent Search Word Functions
    
    func addRecentlyWord(word: String) {
        recentlyWords.append(word)
    }
    
    func deleteRecentlyWord(word: String) {
        if let index = recentlyWords.firstIndex(where: { $0 == word }) {
            recentlyWords.remove(at: index)
        }
    }
    
    // MARK: - Mung Functions
    
    @Published var mungImageCount: Int = 0
    @Published var mungText: [String] = ["고마워요.", "놀랐죠?", "이스터에그에요", "눌러줘서"]
    @Published var mungImage: [String] = ["mungmoongE4", "mungmoongE1", "mungmoongE2", "mungmoongE3"]
    
    func addMungCount() {
        if mungImageCount == 3 {
            mungImageCount = 0
        } else {
            mungImageCount += 1
        }
    }
}
