//
//  SignInView.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/05.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var signUpStore = SignUpStore()
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var isShowingAlert: Bool = false
    
    @EnvironmentObject private var signInStore: SignInStore

    var signIn: SignIn = SignIn()
    
    var body: some View {
        ZStack {
            
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Image("SignInLogo")
                    .resizable()
                    .frame(width: 250, height: 250)
                
                Group {
                    CustomTextField(placeholder: "이메일을 입력하세요", text: $emailText)
                    CustomTextField(placeholder: "비밀번호를 입력하세요", text: $passwordText)
                }
                .padding()
                .frame(width: 353, height: 47)
                .background(Color.white)
                .cornerRadius(15)
                
                
                Button {
                    isShowingAlert = signInStore.checkSignIn(email: emailText, password: passwordText)
                } label: {
                    Text("로그인")
                }
                .padding()
                .frame(width: 353, height: 47)
                .foregroundColor(.white)
                .background(Color.myPrimary)
                .cornerRadius(15)
                
                Spacer()
                
                NavigationLink {
                    SignUpView()
                        .environmentObject(signUpStore)
                } label: {
                    Text("회원가입")
                }
                .padding()
                .frame(width: 100, height: 37)
                .foregroundColor(.white)
                .background(Color.mySecondary)
                .cornerRadius(50)
                
                Text("@ZDCOMPANY")
                    .font(.caption)
                
                Spacer()
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("로그인 결과"),
                    message: Text("로그인에 실패했습니다."),
                    dismissButton: .default(Text("확인"))
                )
            }
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
            .environmentObject(SignInStore())
    }
}
