//
//  SignInStore.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/05.
//

import Foundation
import SwiftUI


final class SignInStore: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    
    @Published var isShowingAlert: Bool = false
    @Published var isDisableSignInButton: Bool = false
    
    @Published var alertDescription: String = ""
    
    @Published var isSignedIn: Bool = false
    
    func checkSignedIn() -> Bool {
        if AuthStore.userUid.isEmpty {
            isSignedIn = false
            return false
        } else {
            isSignedIn = true
            return true
        }
    }
    
    @MainActor
    func checkSignIn() async throws -> Bool {
        isDisableSignInButton = true
        
        let result = try await AuthStore.signIn(email: emailText, password: passwordText)
        self.alertDescription = result.description
        
        switch result {
        case .signIn:
            isSignedIn = true
            return true
        default:
            isShowingAlert = true
            return false
        }
        
    }
    
    @MainActor
    func signOut() {
        Task {
            let result = try AuthStore.signOut()
            if result {
                isSignedIn = false
                emailText = ""
                passwordText = ""
            }
        }
    }
    
    @MainActor
    func deleteUser() {
        Task {
            try await AuthStore.deleteUser()
        }
    }
    
    @MainActor
    func changePassword(password: String) async {
        do {
            try await AuthStore.changePassword(password: password)
        } catch {
            print(error)
        }
    }
    
//    // 파이어베이스에서 로그인
//        @MainActor
//        func signIn() async throws -> Bool {
//            do {
//                //파이어베이스 인증 결과값 가져오기
//                let signInResult = try await Auth.auth().signIn(withEmail: signIns.email, password: signIns.password)
//                //uid 값 담아서 User객체 생성하기
//                let user = signIns.changeToUserModel(id: signInResult.user.uid)
//                //UserStore에 가서 User값 fetch하기
//                try await UserStore.saveUserData(user: user)
//                return true
//            } catch {
//                print(error.localizedDescription)
//                return false
//            }
//        }
//
//    // 프리뷰를 위한 코드
//    var sampleSignIn: SignInData {
//        SignInData(email: "user@naver.com", password: "123456")
//    }
//
//    //로그아웃
//    func logout() {
//        isSuccessSignIn = false
//    }
}
