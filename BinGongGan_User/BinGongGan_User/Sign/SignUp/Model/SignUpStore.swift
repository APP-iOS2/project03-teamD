//
//  SignUpStore.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class SignUpStore: ObservableObject {
    @Published var signUpData = SignUpData()
    @State var certificateNumber: String = ""
    @Published var currentStep: SignUpStep = .first
    @Published var isShowingSignUp: Bool = false
    @Published var isnotAllAgree: Bool = true
    @Published var showAlert: Bool = false
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
        guard (signUpData.bankName != nil) else {
            showToast = true
            toastMessage = "은행을 선택하여 주세요."
            return false
        }
        guard signUpData.accountNumber.count >= 6 else {
            showToast = true
            toastMessage = "계좌번호가 올바르지 않습니다."
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
        guard signUpData.nickname.count >= 2 else {
            showToast = true
            toastMessage = "닉네임을 2글자 이상 입력해주세요."
            return false
        }
        
        guard isValidEmailId() else {
            showToast = true
            toastMessage = "이메일 형식이 올바르지 않습니다."
            return false
        }
        
        guard signUpData.isEmailDuplicateChecked else {
            showToast = true
            toastMessage = "이메일 중복 검사를 진행해주세요."
            return false
        }
        
        guard signUpData.password.count >= 6 else {
            showToast = true
            toastMessage = "비밀번호 6자리 이상 입력하여 주세요."
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
    
    public func isAllAgreed() -> Bool {
        guard signUpData.isTermOfUseAgree else {
            isnotAllAgree = true
            showToast = true
            toastMessage = "서비스 이용약관에 동의하여 주세요."
            return false
        }

        guard signUpData.isPrivacyAgree else {
            isnotAllAgree = true
            showToast = true
            toastMessage = "개인정보 이용약관에 동의하여 주세요."
            return false
        }

        guard signUpData.isLocaitonAgree else {
            isnotAllAgree = true
            showToast = true
            toastMessage = "위치 이용약관에 동의하여 주세요."
            return false
        }
        
        isnotAllAgree = false
        return true
    }
    
    @MainActor
    func checkDuplicateEmail() async -> Bool {
        guard isValidEmailId() else {
            showToast = true
            toastMessage = "올바른 이메일을 입력하여 주세요."
            return false
        }
    
        do {
            if try await UserStore.checkDuplicateEmail(email: signUpData.emailId) {
                showToast = true
                toastMessage = "이미 가입한 이메일입니다."
                return false
            } else {
                signUpData.isEmailDuplicateChecked = true
                return true
            }
        } catch {
            showToast = true
            toastMessage = "이메일 중복검사를 할 수 없습니다."
            return false
        }
    }
    
    @MainActor
    public func postSignUp() async -> Bool {
        guard isAllAgreed() else {
            return false
        }
        do {
            let authResult = try await AuthStore.createUser(email: signUpData.emailId, password: signUpData.password)
            let user = signUpData.changeToUserModel(id: authResult.user.uid)
            try await UserStore.saveUserData(user: user)
            
            UserDefaults.standard.setValue(authResult.user.uid, forKey: "UserId")
            return true
        } catch {
            showToast = true
            if let error = error as? AuthErrorCode {
                if error.errorCode == 17007 {
                    toastMessage = "이미 회원가입 되어있습니다."
                } else {
                    toastMessage = "회원가입을 할 수 없습니다."
                }
            }
            return false
        }
    }

}
