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
    
    @MainActor
    func fetchCurrentUser() async throws {
        do {
            let user = try await UserStore.loadUserData(userId: AuthStore.userUid, user: currentUser)
            self.currentUser = user ?? User(id: "", email: "", name: "", nickname: "", phoneNumber: "", password: "", birthDate: "")
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
    
    @MainActor
    func deleteUser() async throws {
        do {
            try await UserStore.removeUserData(userId: AuthStore.userUid)
        } catch {
            print("deleteUser \(error)")
        }
    }
}




 
