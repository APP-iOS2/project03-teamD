//
//  ReviewStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

final class ReviewStore: ObservableObject {
    @Published var reviewList: [Review] = []
    
    var dbRef = Firestore.firestore().collection("reviews")
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    @MainActor func fetchData() async {
        print("fetchData 시작")
        do {
            let snapshot = try await dbRef.getDocuments()
            
            self.reviewList = try snapshot.documents.compactMap {
                try $0.data(as: Review.self)
            }
        } catch {
            print("Error fetching reviews: \(error)")
        }
        print("fetchData: \(reviewList)")
    }
}
