//
//  FourthSignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

struct FourthSignUpView: View {
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
            PrimaryButton(title: "회원가입", action: {
                Task {
                    if await store.postSignUp() {
                        store.showAlert = true
                    }
                }
            })
            Spacer(minLength: 80)
        }.alert("회원가입", isPresented: $store.showAlert) {
            Button("완료", role: .destructive) {
                Task {
                    if await store.postSignUp() {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        } message: {
            Text("회원가입이 완료되었습니다.")
        }
    }
    
    var TextView: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.myBrown, lineWidth: 1)
                .background(Color.white)
        }.frame(minHeight: 70, maxHeight: 80)
    }
}

struct FourthSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FourthSignUpView()
            .environmentObject(SignUpStore())
    }
}
