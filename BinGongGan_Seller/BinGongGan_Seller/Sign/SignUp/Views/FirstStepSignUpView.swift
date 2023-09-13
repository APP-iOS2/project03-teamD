//
//  FirstStepSignUpView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/12.
//

import SwiftUI
import BinGongGanCore

struct FirstStepSignUpView: View {
    @EnvironmentObject var store: SignUpStore

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("본인인증")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomTextField(maxLength: 5, placeholder: "이름", text: $store.signUpData.name)
                CustomTextField(maxLength: 6, placeholder: "생년월일 6자리", keyboardType: .numberPad, text: $store.signUpData.birthDate)
                HStack {
                    CustomTextField(maxLength: 11, placeholder: "휴대폰 번호", keyboardType: .phonePad, text: $store.signUpData.phoneNumber)
                    CertificationButton
                }
            }
            Group {
                Text("인증 번호")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomTextField(maxLength: 4, backgroundColor: .myLightGray, placeholder: "인증번호 4자리", text: $store.certificateNumber)
                    .disabled(true)
            }
            Spacer()
            PrimaryButton(title: "다음", action: {
                if store.isValidAuthentication() {
                    withAnimation {
                        store.currentStep = .second
                    }
                }
            })
            Spacer()
        }
    }
    
    var CertificationButton: some View {
        Button {
            
        } label: {
            Text("인증")
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                .foregroundColor(.white)
                .background(Color.myMint)
                .clipShape(Capsule())
        }
    }
}

struct FirstStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FirstStepSignUpView()
            .environmentObject(SignUpStore())
    }
}
