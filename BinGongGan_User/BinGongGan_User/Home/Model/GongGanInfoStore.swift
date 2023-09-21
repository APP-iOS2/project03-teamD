
//
//  GongGanInfo.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI
import FirebaseFirestore
import BinGongGanCore
import FirebaseStorage

final class GongGanStore: ObservableObject {
    @Published var gongGanInfo: GongGan = GongGan.sampleGongGan
    @Published var isLoading: Bool = false
    @Published var reviews: [Review] = [
        Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 4, content: "맛있어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]),
        Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 5, content: "넘맛있어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]),
        Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 2, content: "있어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]),
        Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 1, content: "맛없어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]),
    ]
    
    
    let dbRef = Firestore.firestore().collection("Place")
    @MainActor
    func fetchGongGanInfo(placeId: String) async {
        isLoading = true
        do {
            let document = try await dbRef.document(placeId).getDocument()
            let docData: [String: Any] = document.data() ?? [:]
            
            let categoryName: String = docData["placeCategory"] as? String ?? ""
            let placePhone: String = docData["placePhone"] as? String ?? "01050054004"
            
            let addressMap: [String: Any] = docData["address"] as? [String: Any] ?? [:]
            let placeLocation: String = addressMap["address_name"] as? String ?? ""
            let placeName: String = docData["placeName"] as? String ?? ""
            
            let detailGongGan: [DetailGongGan] = try await fetchSubGongGanInfo(placeId: placeId)
            
            let placeImageUrl: [String] = docData["placeImageStringList"] as? [String] ?? [""]
            let placeInfo: [String] = docData["note"] as? [String] ?? [""]
            
            let placeGuideStrings: [String] = docData["placeInfomationList"] as? [String] ?? [""]
            var placeGuide: [PlaceGuide] = []
            for guideString in placeGuideStrings {
                let guide = PlaceGuide(labelTitle: guideString)
                placeGuide.append(guide)
            }
            let isFavorite = docData["isFavorite"] as? Bool ?? false
            let info = GongGan(
                id: placeId,
                placeName: placeName,
                categoryName: categoryName,
                placePhone: placePhone,
                placeLocation: placeLocation,
                detailGongGan: detailGongGan,
                placeImageUrl: placeImageUrl,
                placeInfo: placeInfo,
                placeGuide: placeGuide,
                isFavorite: isFavorite
            )
            self.gongGanInfo = info
            self.isLoading = false
        } catch {
            print("Error fetchGongGanInfo: \(error)")
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    
    
    func fetchSubGongGanInfo(placeId: String) async throws -> [DetailGongGan] {
        var subGongGan: [DetailGongGan] = [DetailGongGan.sample]
        
        do {
            let querySnapshot = try await Firestore.firestore().collection("Room").whereField("placeId", isEqualTo: placeId).getDocuments()
            var tempGongGan: [DetailGongGan] = []
            for document in querySnapshot.documents {
                let docData: [String: Any] = document.data()
                
                let id: String = docData["id"] as? String ?? ""
                //                let isSelected: Bool = docData["place_name"] as? Bool ?? false
                let title: String = docData["name"] as? String ?? ""
                let price: String = docData["price"] as? String ?? "0"
                let detailImageUrl: [String] = docData["imageNames"] as? [String] ?? [""]
                let info: String = docData["note"] as? String ?? ""
                let categoryName: String = docData["categoryName"] as? String ?? ""
                let MinimumReservationTimeInfo: String = docData["MinimumReservationTimeInfo"] as? String ?? ""
                let capacity: String = docData["capacity"] as? String ?? ""
                
                let result = DetailGongGan(
                    id: id,
                    //                    isSelected: isSelected,
                    title: title,
                    price: Int(price) ?? 0,
                    detailImageUrl: detailImageUrl,
                    info: info,
                    categoryName: categoryName,
                    MinimumReservationTimeInfo: MinimumReservationTimeInfo,
                    capacity: capacity
                )
                
                tempGongGan.append(result)
            }
            subGongGan = tempGongGan
            return subGongGan
        } catch {
            throw error
        }
    }
    
    
    @MainActor
    func fetchReViews(placeId: String) async {
        var reviews: [Review] = []
        
        do {
            let querySnapshot = try await Firestore.firestore().collection("reviews").whereField("placeId", isEqualTo: placeId).getDocuments()
            
            for document in querySnapshot.documents {
                let docData = document.data()
                
                let placeId: String = docData["placeId"] as? String ?? ""
                let writerId: String = docData["writerId"] as? String ?? ""
                let date: String = docData["date"] as? String ?? ""
                let rating: Int = docData["rating"] as? Int ?? 0
                let content: String = docData["content"] as? String ?? ""
                
                var reviewImages: [String] = [""]
                if let reviewImageStringList = docData["reviewImageStringList"] as? [String] {
                    reviewImages = reviewImageStringList
                }
                
                let username = await fetchUsername(writerId: writerId)
                
                let result: Review = Review(placeId: placeId, writerId: username, date: date, rating: rating, content: content, reviewImageStringList: reviewImages)
                
                reviews.append(result)
            }
            
            self.reviews = reviews
        } catch {
        }
    }
    
    func fetchUsername(writerId: String) async -> String {
        do {
            let document = try await Firestore.firestore().collection("users").document(writerId).getDocument()
            
            var temName: String = ""
            
            if document.exists {
                let data = document.data()
                let username = data?["name"] as? String ?? "unknown"
                temName = username
            }
            return temName
        } catch {
            print("Error fetching username: \(error.localizedDescription)")
            return "nil"
        }
    }
    func getCompanyName(incruitmentId: String) async throws -> String {
        var companyName: String = ""
        let db = Firestore.firestore()
        
        do {
            let document = try await db.collection("user").document(incruitmentId).getDocument()
            
            if document.exists {
                let data = document.data()
                companyName = data?["companyName"] as? String ?? ""
            }
        } catch {
            print("Error getting document: \(error)")
            throw error
        }
        
        return companyName
    }
    
    func getAllImagesFromStorage(placeId: String) async throws -> [String] {
        var imageUrls: [String] = [""]
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("place/\(placeId)/")
        
        imagesRef.listAll { [weak self] (result, error) in
            guard self != nil else { return }
            
            if let error = error {
                print("Error listing files: \(error.localizedDescription)")
            } else if let items = result?.items {
                for item in items {
                    // 각 파일에 대한 다운로드 URL 가져오기
                    item.downloadURL { url, error in
                        if let downloadURL = url {
                            imageUrls.append(downloadURL.absoluteString)
                            print(downloadURL.absoluteString)
                        } else {
                            print("다운로드 URL을 가져올 수 없습니다.")
                        }
                    }
                }
            }
        }
        return imageUrls
    }
    
    
}

// MARK: - 찜스토어
final class MyFavoriteStore: ObservableObject {
    @Published var myFavoriteGongGan : [GongGan] = []
    @Published var userId: String = ""
    @Published var isLoading: Bool = false
    let dbRef = Firestore.firestore().collection("Place")
    
    func updateMyInfo(placeId: String) {
        dbRef.document(placeId).getDocument { (document, error) in
            if let error = error {
                print("데이터 가져오기 실패: \(error)")
                return
            }
            
            if var docData = document?.data() {
                if let isFavorite = docData["isFavorite"] as? Bool {
                    docData["isFavorite"] = !isFavorite
                } else {
                    docData["isFavorite"] = true
                }
                
                self.dbRef.document(placeId).setData(docData, merge: true) { error in
                    if let error = error {
                        print("수정 실패: \(error)")
                    } else {
                        print("수정 완료")
                    }
                }
            } else {
                print("문서가 없습니다.")
            }
        }
    }
    
    @MainActor
    func fetchMyFavorite() async {
        self.isLoading = true
        do {
            let dbRef = Firestore.firestore().collection("Place")
            
            let querySnapshot = try await dbRef.whereField("isFavorite", isEqualTo: true).getDocuments()
            var fetchArray: [GongGan] = []
            for document in querySnapshot.documents {
                let docData: [String: Any] = document.data() // Get data from the document
                
                let placeId: String = document.documentID
                let categoryName: String = docData["placeCategory"] as? String ?? ""
                let placePhone: String = docData["placePhone"] as? String ?? ""
                
                let addressMap: [String: Any] = docData["address"] as? [String: Any] ?? [:]
                let placeLocation: String = addressMap["address_name"] as? String ?? ""
                let placeName: String = docData["placeName"] as? String ?? ""
                
                let detailGongGan: [DetailGongGan] = try await fetchMyFavoriteSubGongGanInfo(placeId: placeId)
                
                let placeImageUrl: [String] = docData["placeImageStringList"] as? [String] ?? [""]
                let placeInfo: [String] = docData["note"] as? [String] ?? [""]
                
                let placeGuideStrings: [String] = docData["placeInfomationList"] as? [String] ?? [""]
                var placeGuide: [PlaceGuide] = []
                for guideString in placeGuideStrings {
                    let guide = PlaceGuide(labelTitle: guideString)
                    placeGuide.append(guide)
                }
                
                let isFavorite: Bool = docData["isFavorite"] as? Bool ?? false
                
                let info = GongGan(
                    id: placeId,
                    placeName: placeName,
                    categoryName: categoryName,
                    placePhone: placePhone,
                    placeLocation: placeLocation,
                    detailGongGan: detailGongGan,
                    placeImageUrl: placeImageUrl,
                    placeInfo: placeInfo,
                    placeGuide: placeGuide,
                    isFavorite: isFavorite
                )
                
                fetchArray.append(info)
            }
            
            self.myFavoriteGongGan = fetchArray
            self.isLoading = false
            
        } catch {
            self.isLoading = false
            print("Error fetching favorite places: \(error)")
        }
    }
    
    func fetchMyFavoriteSubGongGanInfo(placeId: String) async throws -> [DetailGongGan] {
        var subGongGan: [DetailGongGan] = [DetailGongGan.sample]
        
        do {
            let querySnapshot = try await Firestore.firestore().collection("Room").whereField("placeId", isEqualTo: placeId).getDocuments()
            
            for document in querySnapshot.documents {
                let docData: [String: Any] = document.data()
                
                let id: String = docData["id"] as? String ?? ""
                //                let isSelected: Bool = docData["place_name"] as? Bool ?? false
                let title: String = docData["name"] as? String ?? ""
                let price: String = docData["price"] as? String ?? "0"
                let detailImageUrl: [String] = docData["imageNames"] as? [String] ?? [""]
                let info: String = docData["note"] as? String ?? ""
                let categoryName: String = docData["categoryName"] as? String ?? ""
                let MinimumReservationTimeInfo: String = docData["MinimumReservationTimeInfo"] as? String ?? ""
                let capacity: String = docData["capacity"] as? String ?? ""
                
                let result = DetailGongGan(
                    id: id,
                    title: title,
                    price: Int(price) ?? 0,
                    detailImageUrl: detailImageUrl,
                    info: info,
                    categoryName: categoryName,
                    MinimumReservationTimeInfo: MinimumReservationTimeInfo,
                    capacity: capacity
                )
                
                subGongGan.removeAll()
                subGongGan.append(result)
            }
            
            return subGongGan
        } catch {
            throw error
        }
    }
}
