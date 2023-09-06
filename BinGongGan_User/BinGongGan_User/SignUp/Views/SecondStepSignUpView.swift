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
                    .font(.body1Regular)
                Spacer()
                CustomTextField(placeholder: "이메일 주소", text: $store.signUpData.name)
                Spacer()
            }
            Group {
                Text("비밀번호")
                    .font(.body1Regular)
                Spacer()
                CustomTextField(placeholder: "영문 8자리 이상", text: $store.signUpData.name)
                Spacer()
            }
            Group {
                Text("비밀번호 확인")
                    .font(.body1Regular)
                Spacer()
                CustomTextField(placeholder: "", text: $store.signUpData.birthDate)
            }
            Spacer(minLength: 120)
            PrimaryButton(action: {
                withAnimation {
                    store.currentStep = .third
                }
            }, title: "다음")
            Spacer(minLength: 80)
        }
    }
}

struct SecondStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SecondStepSignUpView()
            .environmentObject(SignUpStore())
    }
}
