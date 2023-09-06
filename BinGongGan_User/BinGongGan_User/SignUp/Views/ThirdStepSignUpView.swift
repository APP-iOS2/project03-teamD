//
//  ThirdStepSignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

struct ThirdStepSignUpView: View {
    @EnvironmentObject var store: SignUpStore
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("빈공간 서비스 이용약관")
                    .font(.body1Regular)
                Spacer()
                TextView
            }
            Group {
                Text("개인정보 수집 및 이용약관")
                    .font(.body1Regular)
                Spacer()
                TextView
            }
            Group {
                Text("위치기반 서비스 이용약관")
                    .font(.body1Regular)
                Spacer()
                TextView
            }
            Spacer()
            CheckButton
            PrimaryButton(action: {
                presentationMode.wrappedValue.dismiss()
            }, title: "회원가입")
            Spacer(minLength: 80)
        }
    }
    
    var TextView: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.myPrimary, lineWidth: 1)
                .background(Color.white)
            Text("")
        }.frame(minHeight: 80, maxHeight: 90)
    }
    
    var CheckButton: some View {
        HStack {
            Spacer()
            Button(action: {
                store.signUpData.agreement.toggle()
            }, label: {
                HStack {
                    Image(systemName: store.signUpData.agreement ? "checkmark.circle" : "checkmark.circle.fill")
                        .resizable()
                        .foregroundColor(.mySecondary)
                        .frame(width: 28, height: 28)
                    Text("전체 동의합니다")
                }
            }).buttonStyle(.plain)
                .font(.body1Regular)
                .padding(.trailing, 10)
        }
    }
}

struct ThirdStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdStepSignUpView()
            .environmentObject(SignUpStore())
    }
}
