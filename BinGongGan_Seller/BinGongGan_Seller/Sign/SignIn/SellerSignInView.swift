//
//  SellerSignInView.swift
//  BinGongGan_Seller
//
//  Created by 박지현 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct SellerSignInView: View {
    @EnvironmentObject private var signInStore: SignInStore
    @EnvironmentObject private var signUpStore: SignUpStore
    
    @State var isDisableSignInButton2: Bool = false

    
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
                    CustomTextField(placeholder: "이메일을 입력하세요", keyboardType: .emailAddress, text: $signInStore.emailText)
                    CustomSecureField(placeholder: "비밀번호를 입력하세요", text: $signInStore.passwordText)
                }
                .padding(.horizontal, 20)
                
                PrimaryButton(title: "로그인") {
                    signInStore.checkSignIn()
                }
                .padding(.horizontal, 20)
                .disabled(signInStore.isDisableSignInButton)
                
//                PrimaryButton(isDisabled: $signInStore.isDisableSignInButton, action: {
//
//                }, title: "로그인")
//                .padding(.horizontal, 20)

                
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
            .alert(isPresented: $signInStore.isShowingAlert) {
                Alert(
                    title: Text("로그인 결과"),
                    message: Text(signInStore.alertDescription),
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
