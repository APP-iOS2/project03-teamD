//
//  SignInStore.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/05.
//

import Foundation

struct SignIn {
    var id: String = UUID().uuidString
    var email: String = "test"
    var password: String = "test"
}

final class SignInStore: ObservableObject {
    @Published var signIns: [SignIn] = [
        SignIn(email: "test", password: "test")
    ]
    @Published var isSuccessSignIn: Bool = false
    
    // 로그인 버튼
    func checkSignIn(email: String, password: String) -> Bool {
            if email == signIns[0].email && password == signIns[0].password {
                print("성공")
                isSuccessSignIn = true
                return false
            } else {
                print("실패")
                isSuccessSignIn = false
                return true
            }
    }
    
    // 프리뷰를 위한 코드
    var sampleSignIn: SignIn {
        SignIn(email: "user@naver.com", password: "123456")
    }
}
