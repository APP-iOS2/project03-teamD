
//
//  GongGanInfo.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI
import FirebaseFirestore
import BinGongGanCore
//struct DetailGongGan: Identifiable {
//    var id: String = UUID().uuidString
//    var isSelected: Bool = false
//    var title: String
//    var price: Int
//    var detailImageUrl: [String]
//    var info: String // 세부공간 정보
//    var categoryName: String // 공간유형
//    var MinimumReservationTimeInfo: String // 최소예약시간정보
//    var capacity: String // 수용인원 (최소1명~ 최대 12명)
final class GongGanStore: ObservableObject {
    @Published var gongGanInfo: GongGan = GongGan.sampleGongGan
    @Published var isLoading: Bool = false
    @Published var reviews: [Review] = [
        Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 3, content: "맛있어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]),
        Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 3, content: "맛있어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]),
        Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 3, content: "맛있어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]),
        Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 3, content: "맛있어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]),
    ]
    
    
    @Published var placeId: String = "E0449968-A636-4024-B3A9-CB9362A7828F"
    
    let dbRef = Firestore.firestore().collection("Place")
    
    func fetchGongGanInfo() async {
        do {
            let document = try await dbRef.document(placeId).getDocument()
            if document.exists {
                let docData: [String: Any] = document.data() ?? [:]
                
                let placeName: String = docData["place_name"] as? String ?? ""
                let categoryName: String = docData["placeCategory"] as? String ?? ""
                let placePhone: String = docData["placePhone"] as? String ?? ""
                
                let addressMap: [String: Any] = docData["address"] as? [String: Any] ?? [:]
                let placeLocation: String = addressMap["address_name"] as? String ?? ""
                
                let detailGongGan: [DetailGongGan] = try await fetchSubGongGanInfo(placeId: placeId)
                
                let placeImageUrl: [String] = docData["placeImageStringList"] as? [String] ?? [""]
                let placeInfo: [String] = docData["note"] as? [String] ?? [""]
                
                let placeGuideStrings: [String] = docData["placeGuide"] as? [String] ?? [""]
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
                
                DispatchQueue.main.async {
                    self.gongGanInfo = info
                }
            }
        } catch {
            print("Error fetchGongGanInfo: \(error)")
        }
    }
    
    func fetchSubGongGanInfo(placeId: String) async throws -> [DetailGongGan] {
        var subGongGan: [DetailGongGan] = [DetailGongGan.sample]
        
        do {
            let document = try await Firestore.firestore().collection("Room").document(placeId).getDocument()
            
            if document.exists {
                let docData: [String: Any] = document.data() ?? [:]
                
                let id: String = docData["id"] as? String ?? ""
                let isSelected: Bool = docData["place_name"] as? Bool ?? false
                let title: String = docData["placeCategory"] as? String ?? ""
                let price: Int = docData["placeCategory"] as? Int ?? 0
                let detailImageUrl: [String] = docData["placeCategory"] as? [String] ?? [""]
                let info: String = docData["placeCategory"] as? String ?? ""
                let categoryName: String = docData["placeCategory"] as? String ?? ""
                let MinimumReservationTimeInfo: String = docData["placeCategory"] as? String ?? ""
                let capacity: String = docData["placeCategory"] as? String ?? ""
                
                let result = DetailGongGan(
                    id: id,
                    isSelected: isSelected,
                    title: title,
                    price: price,
                    detailImageUrl: detailImageUrl,
                    info: info,
                    categoryName: categoryName,
                    MinimumReservationTimeInfo: MinimumReservationTimeInfo,
                    capacity: capacity
                )
                
                subGongGan.append(result)
            }
            return subGongGan
        } catch {
            throw error
        }
    }
    //    public struct Review: Identifiable, Codable {
    //        @DocumentID public var id: String?
    //        public var placeId: String //리뷰 달린 공간 id값
    //        public var writerId: String
    //        public var date: String //작성 날짜
    //        public var rating: Int //별점
    //        public var content: String //내용
    //        public var reviewImageStringList: [String]? //리뷰 이미지
    //
    //        public init(id: String = UUID().uuidString, placeId: String, writerId: String, date: String, rating: Int, content: String, reviewImageStringList: [String]? = nil) {
    //            self.id = id
    //            self.placeId = placeId
    //            self.writerId = writerId
    //            self.date = date
    //            self.rating = rating
    //            self.content = content
    //            self.reviewImageStringList = reviewImageStringList
    //        }
    //    }
    func fetchReViews(id: String) async {
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
                let reviewImageStringList: [String] = docData["reviewImageStringList"] as? [String] ?? [""]
                
                let result: Review = Review(placeId: placeId, writerId: writerId, date: date, rating: rating, content: content, reviewImageStringList: reviewImageStringList)
                
                reviews.append(result)
            }
            
            self.reviews = reviews
        } catch {
        }
    }
    //    func fetch(completion: @escaping (Bool) -> Void) {
    //
    //            userList.removeAll()
    //            db.collection("users").getDocuments { (querySnapshot, error) in
    //
    //                guard let querySnapshot = querySnapshot, error == nil else {
    //                    print("Error fetching data: (error?.localizedDescription ?? ")
    //                    return
    //                }
    //
    //                for document in querySnapshot.documents {
    //                    if let jsonData = try? JSONSerialization.data(withJSONObject: document.data(), options: []),
    //                       let post = try? JSONDecoder().decode(User.self, from: jsonData) {
    //                        self.userList.append(post)
    //                    }
    //                }
    //                completion(true)
    //                print("유저리스트 패치: (self.userList)")
    //            }
    //        }
    //
}

final class MyFavoriteStore: ObservableObject {
    @Published var myFavoriteGongGan : [GongGan] = [
        GongGan.sampleGongGan,
        GongGan.sampleGongGan,
        GongGan.sampleGongGan,
        GongGan.sampleGongGan,
        GongGan.sampleGongGan,
    ]
    @Published var userId: String = ""
    
    let dbRef = Firestore.firestore().collection("Place")
    
    func fetchMyFavorite() async {
        do {
            let document = try await dbRef.document().getDocument()
            if document.exists {
                let docData: [String: Any] = document.data() ?? [:]
                
                let placeId: String = docData["placeId"] as? String ?? ""
                let placeName: String = docData["place_name"] as? String ?? ""
                let categoryName: String = docData["placeCategory"] as? String ?? ""
                let placePhone: String = docData["placePhone"] as? String ?? ""
                
                let addressMap: [String: Any] = docData["address"] as? [String: Any] ?? [:]
                let placeLocation: String = addressMap["address_name"] as? String ?? ""
                
                let detailGongGan: [DetailGongGan] = try await fetchMyFavoriteSubGongGanInfo(id: placeId)
                
                let placeImageUrl: [String] = docData["placeImageStringList"] as? [String] ?? [""]
                let placeInfo: [String] = docData["note"] as? [String] ?? [""]
                
                let placeGuideStrings: [String] = docData["placeGuide"] as? [String] ?? [""]
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
                
                OperationQueue.main.addOperation {
                    if isFavorite {
                        self.myFavoriteGongGan.append(info)
                    }
                }
            }
        } catch {
            print("Error fetchGongGanInfo: \(error)")
        }
    }
    //    func getGongGanId() async throws -> String {
    //        var gongGanId: String = ""
    //        let db = Firestore.firestore()
    //
    //        do {
    //            let document = try await db.collection("Incruitments").document(incruitmentId).getDocument()
    //
    //            if document.exists {
    //                let data = document.data()
    //                companyName = data?["companyName"] as? String ?? ""
    //            }
    //        } catch {
    //            print("Error getting document: \(error)")
    //            throw error
    //        }
    //
    //        return companyName
    //    }
    func fetchMyFavoriteSubGongGanInfo(id: String) async throws -> [DetailGongGan] {
        var subGongGan: [DetailGongGan] = [DetailGongGan.sample]
        
        do {
            let document = try await Firestore.firestore().collection("Room").document(id).getDocument()
            
            if document.exists {
                let docData: [String: Any] = document.data() ?? [:]
                
                let isSelected: Bool = docData["place_name"] as? Bool ?? false
                let title: String = docData["placeCategory"] as? String ?? ""
                let price: Int = docData["placeCategory"] as? Int ?? 0
                let detailImageUrl: [String] = docData["placeCategory"] as? [String] ?? [""]
                let info: String = docData["placeCategory"] as? String ?? ""
                let categoryName: String = docData["placeCategory"] as? String ?? ""
                let MinimumReservationTimeInfo: String = docData["placeCategory"] as? String ?? ""
                let capacity: String = docData["placeCategory"] as? String ?? ""
                
                let result = DetailGongGan(
                    isSelected: isSelected,
                    title: title,
                    price: price,
                    detailImageUrl: detailImageUrl,
                    info: info,
                    categoryName: categoryName,
                    MinimumReservationTimeInfo: MinimumReservationTimeInfo,
                    capacity: capacity
                )
                
                subGongGan.append(result)
            }
            return subGongGan
        } catch {
            throw error
        }
    }
}
