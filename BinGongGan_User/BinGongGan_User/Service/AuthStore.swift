//
//  Auth.swift
//  BinGongGan_User
//
//  Created by 마경미 on 11.09.23.
//

import Foundation
import FirebaseAuth

public class AuthStore {
    // 신규 사용자
    static func createUser(email: String, password: String) async throws -> AuthDataResult {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Sign up successful")
            return authResult
        } catch {
            print("Error occurred when sign up: \(error)")
            throw error
        }
    }
    
    // 기존 사용자
    static func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error occured when signIn: \(error)")
            } else {
                print("SignIn successful")
            }
        }
    }
    
    
    static func signOut() {
        do {
            try Auth.auth().signOut()
            print("Log out successful")
        } catch {
            print("Error logging out: \(error.localizedDescription)")
        }
    }
}
