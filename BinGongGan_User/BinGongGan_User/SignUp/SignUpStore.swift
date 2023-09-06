//
//  SignUpStore.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//
import Foundation
import SwiftUI

struct SignUpData {
    var name: String = ""
    var birthDate: String = ""
    var phoneNumber: String = ""
    var emailId: String = ""
    var password: String = ""
    var passwordCheck: String = ""
    // 이용약관 동의
    var termOfUse: Bool = false
    // 개인정보 수집 동의
    var privacyAgreement: Bool = false
    // 위치 동의
    var locationAgreement: Bool = false
}

class SignUpStore: ObservableObject {
    @Published var signUpData = SignUpData()
    @State var certificateNumber: String = ""
}
