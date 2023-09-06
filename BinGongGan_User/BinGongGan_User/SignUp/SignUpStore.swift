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
    var isTermOfUseAgree: Bool = false
    var isPrivacyAgree: Bool = false
    var isLocaitonAgree: Bool = false
    var isAllAgree: Bool = false
}

enum SignUpStep {
    case first
    case second
    case third
}

final class SignUpStore: ObservableObject {
    @Published var signUpData = SignUpData()
    @State var certificateNumber: String = ""
    @Published var currentStep: SignUpStep = .first
    @Published var showToast: Bool = false
    @Published var toastMessage: String = ""
    
    public func isValidAuthentication() -> Bool {
        guard signUpData.name.count >= 2 else {
            showToast = true
            toastMessage = "이름을 다시 입력하여 주세요."
            return false
        }
        guard signUpData.birthDate.count == 6 else {
            showToast = true
            toastMessage = "생년월일 6자리를 입력하여 주세요."
            return false
        }
        guard signUpData.phoneNumber.count == 11 else {
            showToast = true
            toastMessage = "휴대폰 번호 11자리를 입력하여 주세요."
            return false
        }
        return true
    }
    
    public func isValidEmailId() -> Bool {
        // 이메일 형식을 검사하는 정규 표현식
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: signUpData.emailId)
    }
    
    public func isValidPassword() -> Bool {
        let passwordRegex = "^[a-zA-Z0-9]+$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: signUpData.password)
    }
    
    public func isValidIdAndPassword() -> Bool {
        guard isValidEmailId() else {
            showToast = true
            toastMessage = "이메일 형식이 올바르지 않습니다."
            return false
        }
        
        guard signUpData.password.count >= 4 else {
            showToast = true
            toastMessage = "비밀번호 4자리 이상 입력하여 주세요."
            return false
        }
        
        guard isValidPassword() else {
            showToast = true
            toastMessage = "비밀번호 형식이 올바르지 않습니다."
            return false
        }
        
        guard signUpData.password == signUpData.passwordCheck else {
            showToast = true
            toastMessage = "비밀번호가 일치하지 않습니다."
            return false
        }

        return true
    }
    
    func isAllAgreed() -> Bool {
        guard signUpData.isTermOfUseAgree else {
            showToast = true
            toastMessage = "서비스 이용약관에 동의하여 주세요."
            return false
        }
        
        guard signUpData.isPrivacyAgree else {
            showToast = true
            toastMessage = "개인정보 이용약관에 동의하여 주세요."
            return false
        }
        
        guard signUpData.isLocaitonAgree else {
            showToast = true
            toastMessage = "위치 이용약관에 동의하여 주세요."
            return false
        }
        
        return true
    }
}
