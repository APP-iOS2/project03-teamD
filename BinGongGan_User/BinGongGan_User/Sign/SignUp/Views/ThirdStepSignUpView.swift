//
//  ThirdStepSignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI
import BinGongGanCore

struct ThirdStepSignUpView: View {
    @EnvironmentObject var store: SignUpStore
    @Environment(\.dismiss) var dismiss
    
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
                        Text("빈공간 서비스 이용약관")
                            .font(.body1Bold)
                            .frame(height: 31)
                        TextView
                        AgreementCheckButton(agreement: $store.signUpData.isTermOfUseAgree, text: "빈공간 서비스 이용약관을 동의합니다.")
                    }
                    Group {
                        Text("개인정보 수집 및 이용약관")
                            .font(.body1Bold)
                            .frame(height: 31)
                        TextView
                        AgreementCheckButton(agreement: $store.signUpData.isPrivacyAgree, text: "개인정보 수집 및 이용을 동의합니다.")
                        
                    }
                    Group {
                        Text("위치기반 서비스 이용약관")
                            .font(.body1Bold)
                            .frame(height: 31)
                        TextView
                        AgreementCheckButton(agreement: $store.signUpData.isLocaitonAgree, text: "위치기반 서비스 이용을 동의합니다.")
                    }
                    Spacer()
                    PrimaryButton(isDisabled: $store.isnotAllAgree, action: {
                        Task {
                            if await store.postSignUp() {
                                store.showAlert = true
                            }
                        }
                    }, title: "회원가입")
                    Spacer(minLength: 80)
                }.alert("회원가입", isPresented: $store.showAlert) {
                    Button("완료", role: .cancel) {
                        store.isShowingSignUp = false
                    }
                } message: {
                    Text("회원가입이 완료되었습니다.")
                }
                .padding(.horizontal, 20)
                .onAppear(perform: {
                    store.currentStep = .third
                })
                .onChange(of: store.signUpData.isLocaitonAgree && store.signUpData.isPrivacyAgree && store.signUpData.isTermOfUseAgree) { newValue in
                    store.isAllAgreed()
                }
                .customBackbutton()
                .toolbar(content: {
                    ToolbarItem(content: {
                        Button(action: {
                            store.isShowingSignUp = false
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        })
                    })
                })
            }
        }.edgesIgnoringSafeArea(.all)
            .onTapGesture {
                self.endTextEditing()
            }
            .toast(isShowing: $store.showToast, message: store.toastMessage)
    }
    
    var TextView: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.myBrown, lineWidth: 1)
                .background(Color.white)
        }.frame(minHeight: 70, maxHeight: 80)
    }
}

struct ThirdStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdStepSignUpView()
            .environmentObject(SignUpStore())
    }
}
