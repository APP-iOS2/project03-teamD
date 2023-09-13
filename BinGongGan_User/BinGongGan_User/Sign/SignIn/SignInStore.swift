//
//  SignInStore.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/05.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

final class SignInStore: ObservableObject {
    @Published var isSuccessSignIn: Bool = false

    @Published var signIns: SignInData = SignInData(email: "test", password: "test")

    
    // 로그인 버튼
    func checkSignIn(email: String, password: String) -> Bool {
        if email == signIns.email && password == signIns.password {
            print("성공")
            isSuccessSignIn = true
            return false
        } else {
            print("실패")
            isSuccessSignIn = false
            return true
        }
    }
    
    // 파이어베이스에서 로그인
        @MainActor
        func signIn() async throws -> Bool {
            do {
                //파이어베이스 인증 결과값 가져오기
                let signInResult = try await Auth.auth().signIn(withEmail: signIns.email, password: signIns.password)
                //uid 값 담아서 User객체 생성하기
                let user = signIns.changeToUserModel(id: signInResult.user.uid)
                //UserStore에 가서 User값 fetch하기
                try await UserStore.saveUserData(user: user)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
    
    // 프리뷰를 위한 코드
    var sampleSignIn: SignInData {
        SignInData(email: "user@naver.com", password: "123456")
    }
    
    //로그아웃
    func logout() {
        isSuccessSignIn = false
    }
}
