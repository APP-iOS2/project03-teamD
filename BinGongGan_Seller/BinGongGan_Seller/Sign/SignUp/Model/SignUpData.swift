//
//  SignUpData.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/12.
//

import SwiftUI
import BinGongGanCore

struct SignUpData {
    var name: String = ""
    var birthDate: String = ""
    var phoneNumber: String = ""
    var nickname: String = ""
    var emailId: String = ""
    var password: String = ""
    var passwordCheck: String = ""
    var accountNumber : String = ""
    var registrationImage : UIImage = UIImage()
    var registrationNumber : String = ""
    var isTermOfUseAgree: Bool = false
    var isPrivacyAgree: Bool = false
    var isLocaitonAgree: Bool = false
    var isAllAgree: Bool = false
    
    
    func changeToSellerModel(id: String) -> Seller {
        return Seller(id: id, name: name, birthDate: birthDate, phoneNumber: phoneNumber, email: emailId, nickname: nickname, password: password, accountNumber: accountNumber, registrationNum: registrationNumber, registrationImage: "")
    }
}

enum SignUpStep {
    case first
    case second
    case third
    case fourth
}
