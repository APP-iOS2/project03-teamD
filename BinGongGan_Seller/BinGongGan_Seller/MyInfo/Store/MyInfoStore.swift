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
    @Published var myInfo: Seller = Seller(id: "", name: "", birthDate: "", phoneNumber: "", email: "", nickname: "", password: "", accountNumber: "", registrationNum: "", registrationImage: "")
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    @MainActor func fetchData() async {
//        guard let sellerId = sellerId else {return}
        
        let dbRef = Firestore.firestore().collection("sellers")
            .document(AuthStore.userUid)
        do {
            let snapshot = try await dbRef.getDocument()

            let data = try snapshot.data(as: Seller.self)
            myInfo = data
            
        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
    
    
    
    private func addMyInfo(seller: Seller) {
//        print(seller)
//        myInfo = MyInfo(name: seller.name, email: seller.email, phoneNumber: seller.phoneNumber, accountNumber: seller.accountNumber, companyNumber: seller.registrationNum)
    }
}


