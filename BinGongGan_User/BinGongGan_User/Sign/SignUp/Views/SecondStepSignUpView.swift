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
    @State var isNext: Bool = false
    
    var body: some View {
        ZStack {
            Color.myBackground
            VStack {
                VStack {
                    Spacer()
                    Text("회원가입")
                        .font(.head1Regular)
                }
                .frame(maxHeight: 150)
                VStack(alignment: .leading) {
                    Group {
                        Text("닉네임")
                            .font(.body1Bold)
                            .frame(height: 38)
                        CustomTextField(placeholder: "닉네임", text: $store.signUpData.nickname)
                    }
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
                        CustomSecureField(placeholder: "영문, 숫자 포함 6-8자리",text: $store.signUpData.password)
                    }
                    Group {
                        Text("비밀번호 확인")
                            .font(.body1Bold)
                            .frame(height: 38)
                        CustomSecureField(placeholder: "", text: $store.signUpData.passwordCheck)
                    }
                    Spacer()
                    PrimaryButton(isDisabled: .constant(false), action: {
                        if store.isValidIdAndPassword() {
                            isNext = true
                        }
                    }, title: "다음")
                    Spacer()
                }
                .padding(.horizontal, 20)
                .onAppear(perform: {
                    store.currentStep = .second
                })
                .navigationDestination(isPresented: $isNext, destination: {
                    ThirdStepSignUpView()
                        .environmentObject(store)
                })
                .customBackbutton()
            }
        }.edgesIgnoringSafeArea(.all)
            .onTapGesture {
                self.endTextEditing()
            }
            .toast(isShowing: $store.showToast, message: store.toastMessage)
    }
}

struct SecondStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SecondStepSignUpView()
            .environmentObject(SignUpStore())
    }
}
