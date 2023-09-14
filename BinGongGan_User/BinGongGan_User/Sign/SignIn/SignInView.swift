//
//  SignInView.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct SignInView: View {
    @EnvironmentObject private var signInStore: SignInStore
    @EnvironmentObject private var signUpStore: SignUpStore
    @EnvironmentObject private var myUserStore: MyUserStore
    
    var body: some View {
        ZStack {
            
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Image("SignInLogo")
                    .resizable()
                    .frame(width: 250, height: 250)
                
                VStack {
                    CustomTextField(placeholder: "이메일을 입력하세요", keyboardType: .emailAddress, text: $signInStore.emailText)
                    CustomSecureField(placeholder: "비밀번호를 입력하세요", text: $signInStore.passwordText)
                }
                .padding(.horizontal, 20)
                
                PrimaryButton(isDisabled: $signInStore.isDisableSignInButton, action: {
                    Task {
                        let result = try await signInStore.checkSignIn()
                        if result {
                            try await myUserStore.fetchCurrentUser()
                        }
                        signInStore.isDisableSignInButton = false
                    }
                }, title: "로그인")
                .padding(.horizontal, 20)
                
                Spacer()
                Button(action: {
                    signUpStore.signUpData = SignUpData()
                    signUpStore.isShowingSignUp = true
                }, label: {
                    Text("회원가입")
                }).padding()
                    .font(.body1Bold)
                    .frame(width: 120, height: 40)
                    .foregroundColor(.white)
                    .background(Color.myMint)
                    .cornerRadius(50)
                
                Text("@ZDCOMPANY")
                    .font(.caption)
                
                Spacer()
            }
            .alert(isPresented: $signInStore.isShowingAlert) {
                Alert(
                    title: Text("로그인 결과"),
                    message: Text("로그인에 실패했습니다."),
                    dismissButton: .default(Text("확인"))
                )
            }
            .fullScreenCover(isPresented: $signUpStore.isShowingSignUp, content: {
                FirstStepSignUpView()
                    .environmentObject(signUpStore)
            })
        }
        .ignoresSafeArea()
        .onAppear {
            signUpStore.currentStep = .first
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
