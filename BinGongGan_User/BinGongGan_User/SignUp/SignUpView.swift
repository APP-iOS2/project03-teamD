//
//  SignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var store: SignUpStore

    var body: some View {
        ZStack {
            Color.myBackground
            VStack {
                Spacer(minLength: 120)
                Text("회원가입")
                    .font(.head1Regular)
                Spacer(minLength: 32)
                SignUpProgressView
                Spacer(minLength: 60)
                FirstStepSignUpView
                Spacer(minLength: 80)
                PrimaryButton(action: {
                    
                }, title: "다음")
                Spacer(minLength: 90)
            }.padding(.horizontal, 20)
        }.edgesIgnoringSafeArea(.all)
    }
    
    var SignUpProgressView: some View {
        HStack {
            Circle()
                .foregroundColor(.mySecondary)
                .frame(width: 12, height: 12)
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
                .background(Color.myLightGray)
            Circle()
                .stroke(Color.mySecondary, lineWidth: 1.3)
                .frame(width: 12, height: 12)
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
                .background(Color.myLightGray)
            Circle()
                .stroke(Color.mySecondary, lineWidth: 1.3)
                .frame(width: 12, height: 12)
        }
    }
    
    var FirstStepSignUpView: some View {
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

struct SignUpView_Previews: PreviewProvider {
//    @StateObject var store = SignUpStore()
    static var previews: some View {
        SignUpView()
            .environmentObject(SignUpStore())
    }
}
