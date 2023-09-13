//
//  UserStore.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/13.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore
import FirebaseFirestoreSwift

final class MyUserStore: ObservableObject {
    @Published var currentUser: User = User(id: "", email: "", name: "", nickname: "", phoneNumber: "", password: "", birthDate: "")
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        do {
            let user = try await UserStore.loadUserData(userId: AuthStore.userUid, user: currentUser)
            self.currentUser = user
        } catch {
            print("Error fetchCurrentUser \(error)")
        }
    }
    
    @MainActor
    func editAccount(user: User) async throws {
        do {
            try await UserStore.updateUserData(user: user)
            currentUser = user
        } catch {
            print("Error editAccount \(error)")
        }
    }
}




 
