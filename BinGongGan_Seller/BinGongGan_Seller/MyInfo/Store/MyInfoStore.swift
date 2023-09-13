//
//  MyInfoStore.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/13.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

final class MyInfoStore: ObservableObject {
    let sellerId = UserDefaults.standard.string(forKey: "sellerId")
    
    @Published var myInfo: MyInfo = MyInfo(name: "", email: "", phoneNumber: "", accountNumber: "", companyNumber: "")
    
    init() {
        print("Hello")
        Task {
            await fetchData()
        }
    }
    
    @MainActor func fetchData() async {
//        guard let sellerId = sellerId else {return}
        
        let dbRef = Firestore.firestore().collection("sellers")
            .document("0adudYbXvrVYB3Y81ePwJa9Qf603")
        do {
            let snapshot = try await dbRef.getDocument()
            
            guard let data = snapshot.data() else {return}
            let docData: [String : Any] = data
            print("마이페이지 데이터 시작")
            print(docData)
            let jsonData = try JSONSerialization.data(withJSONObject: docData, options: [])
            let decoder = JSONDecoder()
            let sellerData = try decoder.decode(Seller.self, from: jsonData)
            addMyInfo(seller: sellerData)
            print(sellerData)
        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
    
    private func addMyInfo(seller: Seller) {
        print(seller)
        myInfo = MyInfo(name: seller.name, email: seller.email, phoneNumber: seller.phoneNumber, accountNumber: seller.accountNumber, companyNumber: seller.registrationNum)
    }
    
}


