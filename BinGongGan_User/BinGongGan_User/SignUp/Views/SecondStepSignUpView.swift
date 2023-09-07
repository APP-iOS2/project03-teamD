//
//  SecondStepSignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI
import BinGongGanCore

struct SecondStepSignUpView: View {
    @EnvironmentObject var store: SignUpStore
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("아이디(이메일)")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomTextField(placeholder: "이메일 주소", keyboardType: .emailAddress,text: $store.signUpData.emailId)
            }
            Group {
                Text("비밀번호")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomSecureField(placeholder: "영문, 숫자 포함 4-8자리",text: $store.signUpData.password)
            }
            Group {
                Text("비밀번호 확인")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomSecureField(placeholder: "", text: $store.signUpData.passwordCheck)
            }
            Spacer()
            PrimaryButton(action: {
                if store.isValidIdAndPassword() {
                    withAnimation {
                        store.currentStep = .third
                    }
                }
            }, title: "다음")
            Spacer()
        }
    }
}

struct SecondStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SecondStepSignUpView()
            .environmentObject(SignUpStore())
    }
}
