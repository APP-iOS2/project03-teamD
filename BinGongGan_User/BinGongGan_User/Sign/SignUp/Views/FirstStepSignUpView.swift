//
//  FirstStepSignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI
import BinGongGanCore

struct FirstStepSignUpView: View {
    @EnvironmentObject var store: SignUpStore
    @State private var isShowingBankSheet: Bool = false
    @State private var isNext: Bool = false
    
    var body: some View {
        NavigationStack {
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
                        identifyVerificationView
                        accountView
                        PrimaryButton(isDisabled: .constant(false), action: {
                            if store.isValidAuthentication() {
                                isNext = true
                            }
                        }, title: "다음")
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .onAppear(perform: {
                        store.currentStep = .first
                    })
                    .sheet(isPresented: $isShowingBankSheet, content: {
                        Text("")
                            .presentationDetents([.medium])
                    })
                    .navigationDestination(isPresented: $isNext, destination: {
                        SecondStepSignUpView()
                            .environmentObject(store)
                    })
                }
            }.edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.endTextEditing()
                }
                .toast(isShowing: $store.showToast, message: store.toastMessage)
        }
    }
    
    var CertificationButton: some View {
        Button {
            
        } label: {
            Text("인증")
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                .foregroundColor(.white)
                .background(Color.myMint)
                .clipShape(Capsule())
        }
    }
    
    var identifyVerificationView: some View {
        Group {
            Group {
                Text("본인인증")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomTextField(maxLength: 5, placeholder: "이름", text: $store.signUpData.name)
                CustomTextField(maxLength: 6, placeholder: "생년월일 6자리", keyboardType: .numberPad, text: $store.signUpData.birthDate)
                HStack {
                    CustomTextField(maxLength: 11, placeholder: "휴대폰 번호", keyboardType: .phonePad, text: $store.signUpData.phoneNumber)
                    CertificationButton
                }
            }
            Group {
                Text("인증 번호")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomTextField(maxLength: 4, backgroundColor: .myLightGray, placeholder: "인증번호 4자리", text: $store.certificateNumber)
                    .disabled(true)
            }
        }
    }
    
    var accountView: some View {
        Group {
            Text("환불 정보")
                .font(.body1Bold)
                .frame(height: 38)
            HStack {
                CustomTextField(backgroundColor: .myLightGray, placeholder: "예금주명(이름과 동일)", text: $store.signUpData.name)
                    .disabled(true)
                Button(action: {
                    isShowingBankSheet = true
                }, label: {
                    Text("은행")
                })
            }
            CustomTextField(placeholder: "환불 계좌 번호", text: $store.signUpData.accountNumber)
        }
        
    }
}

struct FirstStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FirstStepSignUpView()
            .environmentObject(SignUpStore())
    }
}
