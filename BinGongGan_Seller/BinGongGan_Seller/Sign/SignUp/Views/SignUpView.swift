//
//  SignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var store: SignUpStore
    
    var body: some View {
        ZStack {
            Color.myBackground
            VStack {
                VStack {
                    Spacer(minLength: 90)
                    Text("회원가입")
                        .font(.head1Regular)
                    Spacer()
                }
                .frame(maxHeight: 190)
                if store.currentStep == .first {
                    FirstStepSignUpView()
                        .environmentObject(store)
                } else if store.currentStep == .second {
                    SecondStepSignUpView()
                        .environmentObject(store)
                } else if store.currentStep == .third {
                    ThirdStepSignUpView()
                        .environmentObject(store)
                } else {
                    FourthSignUpView()
                        .environmentObject(store)
                }
            }
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            self.endTextEditing()
        }
        .toast(isShowing: $store.showToast, message: store.toastMessage)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(SignUpStore())
    }
}
