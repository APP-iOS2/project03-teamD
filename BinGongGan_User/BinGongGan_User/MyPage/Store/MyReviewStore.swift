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
    
    static let service = FirestoreService()
    private let dbRef = Firestore.firestore()
    private let storage = Storage.storage().reference()
    
    init(){}
    
    func addReview(placeId: String, writerId: String, rating: Int, content: String, images: [UIImage]) async throws{
        let date = self.currentDateToString()
        let id = UUID().uuidString
        let newReview = Review(placeId: placeId, writerId: writerId, date: date, rating: rating, content: content)
        do {
            try await MyReviewStore.service.saveDocument(collectionId: .reviews, documentId: id, data: newReview)
            if !images.isEmpty {
                self.uploadImage(images: images, reviewId: id)
            }
        } catch {
            throw error
        }
        try await fetchReviews()
    }
    
    func fetchReviews() async throws {
        //TODO: - User 로그인, 예약 내역 연결 후 해당 유저 및 공간 판매자 정보 가져와 보여줄 수 있도록 수정하기
        var tempList: [Review] = []
        let query = dbRef.collection(Collections.reviews.rawValue).whereField("writerId", isEqualTo: "xll3TbjPUUZOtWVQx2tsetWlvpV2")
        
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
    
    func findReply(reviewId: String?) async throws -> Reply?{
        guard let id = reviewId else { return nil }
        do {
            let reply = try await dbRef.collection("reply").document(id).getDocument(as: Reply.self)
            
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
    
    func uploadImage(images: [UIImage], reviewId: String) {
        let path = storage.child("reviews").child(reviewId)
        
        for (index, image) in images.enumerated() {
            guard let imageData = image.jpegData(compressionQuality: 0.3) else { return  }
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpeg"
            let imageName = reviewId + String(index)
            
            let pullPath = path.child(imageName)
            
            pullPath.putData(imageData, metadata: metaData) { metaData, error in
                pullPath.downloadURL { url, error in
                    if let error = error {
                        print(error)
                        return
                    }
                    print("Image \(index) uploaded successfully")
                }
            }
        }
    }
    
    func downLoadImageUrl() async throws {
        
    }
    
    func removeReview(reviewId: String?) {
        guard let id = reviewId else { return }
        
        dbRef.collection(Collections.reviews.rawValue).document(id).delete()
        storage.child("reviews").child(id).delete { error in
            if let error = error {
                print(error)
            }
        }
    }
}
