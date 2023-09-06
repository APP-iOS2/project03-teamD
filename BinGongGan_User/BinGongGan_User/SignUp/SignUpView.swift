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
                FirstStepSignUpView()
                    .environmentObject(store)
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
}

struct SignUpView_Previews: PreviewProvider {
    //    @StateObject var store = SignUpStore()
    static var previews: some View {
        SignUpView()
            .environmentObject(SignUpStore())
    }
}
