//
//  LoginStore.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/05.
//

import Foundation

struct Login {
    var id: String = UUID().uuidString
    var email: String
    var password: String
}

class LoginStore: ObservableObject {
    @Published var logins: [Login] = [
        Login(email: "user@naver.com", password: "123456")
    ]
    
    // 로그인 버튼
    func checkLogin(email: String, password: String) -> Bool {
            if email == logins[0].email && password == logins[0].password {
                print("성공")
                return false
            } else {
                print("실패")
                return true
            }
    }
    
    // 프리뷰를 위한 코드
    var sampleLogin: Login {
        Login(email: "user@naver.com", password: "123456")
    }
}
