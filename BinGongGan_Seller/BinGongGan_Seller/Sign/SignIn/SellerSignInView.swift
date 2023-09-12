//
//  SellerSignInView.swift
//  BinGongGan_Seller
//
//  Created by 박지현 on 2023/09/11.
//

import SwiftUI

struct SellerSignInView: View {
    @EnvironmentObject private var signInStore: SignInStore
    @EnvironmentObject private var signUpStore: SignUpStore
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var isShowingAlert: Bool = false
    
    var signIn: SignIn = SignIn()
    
    var body: some View {
        ZStack {
            
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("SignInLogo")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .overlay(alignment: .bottom) {
                        Text("Biz")
                            .padding()
                            .font(.head1Bold)
                            .foregroundColor(.myBrown)
                    }
                
                VStack {
                    CustomTextField(placeholder: "이메일을 입력하세요", keyboardType: .emailAddress, text: $emailText)
                    CustomSecureField(placeholder: "비밀번호를 입력하세요", text: $passwordText)
                }
                .padding(.horizontal, 20)
                
                
                
                PrimaryButton(title: "로그인") {
                    isShowingAlert = signInStore.checkSignIn(email: emailText, password: passwordText)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                NavigationLink {
                    SignUpView()
                        .environmentObject(signInStore)
                        .environmentObject(signUpStore)
                } label: {
                    Text("Biz 회원가입")
                }
                .padding()
                .font(.body1Bold)
                .frame(width: 120, height: 40)
                .foregroundColor(.white)
                .background(Color.myMint)
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
        //        .onAppear {
        //            signUpStore.currentStep = .first
        //        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SellerSignInView()
        //            .environmentObject(SignInStore())
    }
}
