//
//  SignUpModel.swift
//  BinGongGan_User
//
//  Created by 마경미 on 11.09.23.
//

import Foundation
import BinGongGanCore

struct SignUpData {
    var name: String = ""
    var birthDate: String = ""
    var phoneNumber: String = ""
    var bankName: String?
    var accountNumber: String = ""
    var nickname: String = ""
    var emailId: String = ""
    var password: String = ""
    var passwordCheck: String = ""
    var isTermOfUseAgree: Bool = false
    var isPrivacyAgree: Bool = false
    var isLocaitonAgree: Bool = false
    var isAllAgree: Bool = false
    var isEmailDuplicateChecked = false
    
    func changeToUserModel(id: String) -> User {
        return User(id: id, email: emailId, name: name, nickname: nickname, phoneNumber: phoneNumber, password: password, birthDate: birthDate, accountNumber: accountNumber, accountBank: bankName, accountHolder: name)
    }
}

enum SignUpStep {
    case first
    case second
    case third
}
