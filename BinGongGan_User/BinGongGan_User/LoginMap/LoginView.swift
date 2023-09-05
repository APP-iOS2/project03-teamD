//
//  LoginView.swift
//  BinGongGan_User
//
//  Created by 윤지호 on 2023/09/05.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("LoginLogo")
                .resizable()
                .frame(width: 250, height: 250)
            
            Group{
                TextField("이메일을 입력하세요", text: $emailText)
                TextField("비밀번호를 입력하세요", text: $passwordText)
            }
            .padding()
            .frame(width: 353, height: 47)
            .background(Color.white)
            .cornerRadius(15)
            
            
            Button {
                //
            } label: {
                Text("로그인")
            }
            .padding()
            .frame(width: 353, height: 47)
            .foregroundColor(.white)
            .background(Color.gray)
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
            .background(Color.gray)
            .cornerRadius(50)
            
            Text("@hanelCOMPANY")
                .font(.caption)

            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
