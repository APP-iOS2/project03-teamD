//
//  MyInfoStore.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/13.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

enum EditType: CaseIterable {
    case nickName
    case phoneNumber
    case accountNumber
    
    var name: String {
        switch self {
        case .nickName:
            return "닉네임"
        case .phoneNumber:
            return "연락처"
        case .accountNumber:
            return "계좌번호"
        }
    }
}

final class MyInfoStore: ObservableObject {
    @Published var myInfo: Seller = Seller(id: "", name: "", birthDate: "", phoneNumber: "", email: "", nickname: "", password: "", bankName: "", accountNumber: "", registrationNum: "", registrationImage: "")
    
    @Published var editType: EditType = .nickName
    var isButtonDisabled: Bool {
        switch editType {
        case .nickName:
            return myInfo.nickname.isEmpty
        case .phoneNumber:
            return myInfo.phoneNumber.isEmpty
        case .accountNumber:
            return myInfo.accountNumber.isEmpty
        }
    }
    
    static let service = FirestoreService()
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    @MainActor
    func fetchData() async {
        do {
            if let seller = try await SellerStore.fetchUserData() {
                myInfo = seller
            }

        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
    
    @MainActor
    func updateData() async {
        do {
            try await SellerStore.saveUserData(seller: myInfo)
        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
    
    private func addMyInfo(seller: Seller) {
        
    }
}


