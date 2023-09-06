//
//  FirstStepSignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

struct FirstStepSignUpView: View {
    @EnvironmentObject var store: SignUpStore
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("본인인증")
                    .font(.body1Regular)
                Spacer(minLength: 25)
                CustomTextField(placeholder: "이름", text: $store.signUpData.name)
                Spacer(minLength: 25)
                CustomTextField(placeholder: "생년월일 6자리", text: $store.signUpData.birthDate)
                Spacer(minLength: 25)
                HStack {
                    CustomTextField(placeholder: "휴대폰 번호", text: $store.signUpData.phoneNumber)
                    CertificationButton
                }
                Spacer(minLength: 25)
            }
            Group {
                Text("인증 번호")
                    .font(.body1Regular)
                Spacer(minLength: 25)
                CustomTextField(backgroundColor: .myLightGray, placeholder: "인증번호 4자리", text: $store.certificateNumber)
                    .disabled(true)
            }
        }
    }
    
    var CertificationButton: some View {
        Button {
            
        } label: {
            Text("인증")
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                .foregroundColor(.white)
                .background(Color.mySecondary)
                .clipShape(Capsule())
        }
    }
}

struct FirstStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FirstStepSignUpView()
    }
}
