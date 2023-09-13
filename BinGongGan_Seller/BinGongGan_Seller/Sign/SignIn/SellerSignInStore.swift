//
//  SellerSignInStore.swift
//  BinGongGan_Seller
//
//  Created by 박지현 on 2023/09/11.
//

import Foundation

final class SignInStore: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    
    @Published var isShowingAlert: Bool = false
    @Published var isDisableSignInButton: Bool = false
    
    @Published var alertDescription: String = ""
    
    @Published var isSignedIn: Bool = false
    
    func checkSignedIn() {
        if AuthStore.userUid.isEmpty {
            isSignedIn = false
        } else {
            isSignedIn = true
        }
    }
    
    // 로그인 버튼
    @MainActor
    func checkSignIn() {
        isDisableSignInButton = true
        Task {
            let result = try await AuthStore.signIn(email: emailText, password: passwordText)
            self.alertDescription = result.description
            
            switch result {
            case .signIn:
                isSignedIn = true
            default:
                isShowingAlert = true
            }
            self.isDisableSignInButton = false
        }
    }
    
    @MainActor
    func SignOut() {
        Task {
            let result = try AuthStore.signOut()
            if result {
                isSignedIn = false
            }
        }
    }
    
}
