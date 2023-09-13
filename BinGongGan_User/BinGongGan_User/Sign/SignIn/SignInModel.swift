//
//  SignInModel.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/12.
//

import Foundation
import BinGongGanCore

struct SignInData {
    var id: String = UUID().uuidString
    var email: String
    var password: String
    
    func changeToUserModel(id: String) -> User {
        return User(id: id, email: email, name: "", nickname: "", phoneNumber: "", password: password, birthDate: "")
    }
}

