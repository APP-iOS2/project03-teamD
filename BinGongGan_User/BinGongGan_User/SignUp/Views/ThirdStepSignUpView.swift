//
//  ThirdStepSignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

struct ThirdStepSignUpView: View {
    @EnvironmentObject var store: SignUpStore
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("빈공간 서비스 이용약관")
                    .font(.body1Bold)
                    .frame(height: 31)
                TextView
                AgreementCheckButton(agreement: $store.signUpData.isTermOfUseAgree, text: "빈공간 서비스 이용약관을 동의합니다.")
            }
            Group {
                Text("개인정보 수집 및 이용약관")
                    .font(.body1Bold)
                    .frame(height: 31)
                TextView
                AgreementCheckButton(agreement: $store.signUpData.isPrivacyAgree, text: "개인정보 수집 및 이용을 동의합니다.")
                
            }
            Group {
                Text("위치기반 서비스 이용약관")
                    .font(.body1Bold)
                    .frame(height: 31)
                TextView
                AgreementCheckButton(agreement: $store.signUpData.isLocaitonAgree, text: "위치기반 서비스 이용을 동의합니다.")
            }
            Spacer()
//            AgreementCheckButton(agreement: $store.signUpData.isAllAgree, text: "전체 동의합니다")
            PrimaryButton(action: {
                if store.isAllAgreed() {
                    presentationMode.wrappedValue.dismiss()
                }
            }, title: "회원가입")
            Spacer(minLength: 80)
        }
    }
    
    var TextView: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.myPrimary, lineWidth: 1)
                .background(Color.white)
        }.frame(minHeight: 70, maxHeight: 80)
    }
}

struct ThirdStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdStepSignUpView()
            .environmentObject(SignUpStore())
    }
}
