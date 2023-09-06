//
//  LoginView.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/05.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var isShowingAlert: Bool = false
    
    @ObservedObject var loginStore: LoginStore = LoginStore()
    var login: Login
    
    
    var body: some View {
        ZStack{
            
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Image("LoginLogo")
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
                    isShowingAlert = loginStore.checkLogin(email: emailText, password: passwordText)
                } label: {
                    Text("로그인")
                }
                .padding()
                .frame(width: 353, height: 47)
                .foregroundColor(.white)
                .background(Color.myPrimary)
                .cornerRadius(15)
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("회원가입")
                }
                .padding()
                .frame(width: 100, height: 37)
                .foregroundColor(.white)
                .background(Color.mySecondary)
                .cornerRadius(50)
                
                Text("@hanelCOMPANY")
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginStore: LoginStore(), login: LoginStore().sampleLogin)
    }
}
