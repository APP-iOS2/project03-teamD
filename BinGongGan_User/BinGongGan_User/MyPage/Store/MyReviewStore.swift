//
//  MyReviewStore.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import Firebase
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class MyReviewStore: ObservableObject {
    @Published var myReviews: [Review] = []
    
    let service = FirestoreService()
    private let dbRef = Firestore.firestore()
    private let storage = Storage.storage().reference()
    
    init(){}
    
    func addReview(placeId: String, rating: Int, content: String, images: [UIImage] , reservationId: String) async throws{
        let date = self.currentDateToString()
        let id = UUID().uuidString
        let newReview = Review(placeId: placeId, writerId: AuthStore.userUid, date: date, rating: rating, content: content)
        do {
            try await service.saveDocument(collectionId: .reviews, documentId: id, data: newReview)
            
            self.uploadImage(images: images, reviewId: id) { imageUrls in
                if let imageUrls = imageUrls {
                    self.dbRef.collection(Collections.reviews.rawValue).document(id).updateData(["reviewImageStringList": imageUrls]) { error in
                        if let error = error {
                            print("Error updating document: \(error.localizedDescription)")
                        } else {
                            print("Document successfully updated with image URLs")
                            self.dbRef.collection("Reservation")
                                .document(reservationId)
                                .setData([
                                    "reservationState": 3
                                ],merge: true)
                        }
                    }
                }
                
            }
        } catch {
            throw error
        }
        try await fetchReviews()
    }
    
    func fetchReviews() async throws {
        var tempList: [Review] = []
        let query = dbRef.collection(Collections.reviews.rawValue).whereField("writerId", isEqualTo: AuthStore.userUid)
        
        do {
            let snapshot = try await query.getDocuments()
            let documents = snapshot.documents
            
            for document in documents {
                do {
                    let review = try document.data(as: Review.self)
                    tempList.append(review)
                }catch let err {
                    print("error : \(err)")
                }
            }
            self.myReviews = tempList
            
        } catch {
            print("Error getting document: \(error)")
        }
    }
    
    func getPlaceInfo(placeId: String) async throws -> Place?{
        let document = try await dbRef.collection("Place").document(placeId).getDocument()
        if let placeData = document.data() {
            let addressMap: [String: Any] = placeData["address"] as? [String: Any] ?? [:]
            let placeCategoryString = placeData["placeCategory"] as? String ?? "Share"
            let placeCategory = PlaceCategory.fromRawString(placeCategoryString)
            let place = Place(
                sellerId: placeData["sellerId"] as? String ?? "sellerId",
                placeName: placeData["placeName"] as? String ?? "placeName",
                placeCategory: placeCategory,
                placeImageStringList: placeData["placeImageStringList"] as? [String] ?? [""],
                note: placeData["note"] as? [String] ?? [""],
                placeInfomationList: placeData["placeInfomationList"] as? [String] ?? [""],
                address: Address(
                    address: addressMap["address_name"] as? String ?? "sellerId",
                    placeName: addressMap["placeName_name"] as? String ?? "placeName",
                    longitude: addressMap["x"] as? String ?? "x",
                    latitude: addressMap["y"] as? String ?? "y")
            )
            return place
        }
        return nil
    }
    
    func findReply(reviewId: String?) async throws -> Reply?{
        guard let id = reviewId else { return nil }
        do {
            let reply = try await dbRef.collection("Replies").document(id).getDocument(as: Reply.self)
            
            return reply
        } catch {
            print("Error getting document: \(error)")
        }
        return nil
    }
    
    func currentDateToString() -> String {
        let currentDate:Date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd EEE"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: currentDate)
    }
    
    func uploadImage(images: [UIImage], reviewId: String, completion: @escaping ([String]?) -> Void) {
        let path = storage.child("reviews").child(reviewId)
        var imageUrls: [String] = []
        
        
        for (index, image) in images.enumerated() {
            
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpeg"
            let imageName = reviewId + String(index)
            
            let pullPath = path.child(imageName)
            if let imageData = image.jpegData(compressionQuality: 0.4) {
                pullPath.putData(imageData, metadata: metaData) { (metadata, error) in
                    if let error = error {
                        print("Error uploading image at index \(index): \(error.localizedDescription)")
                    } else {
                        pullPath.downloadURL { (url, error) in
                            if let downloadURL = url?.absoluteString {
                                imageUrls.append(downloadURL)
                                
                                if imageUrls.count == images.count {
                                    // 모든 이미지 업로드가 완료되면 이미지 URL을 Firestore 문서에 추가
                                    completion(imageUrls)
                                }
                            } else {
                                print("Error getting download URL at index \(index): \(error?.localizedDescription ?? "")")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func downLoadImageUrl() async throws {
        
    }
    
    func removeReview(reviewId: String?) async throws {
        guard let id = reviewId else { return }
        
        try? await dbRef.collection(Collections.reviews.rawValue).document(id).delete()
        storage.child("reviews").child(id).delete { error in
            if let error = error {
                print(error)
            }
        }
        try await fetchReviews()
    }
}
