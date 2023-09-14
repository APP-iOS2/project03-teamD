//
//  PasswordEditView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct PasswordEditView: View {
    @EnvironmentObject var myUserStore: MyUserStore
    @EnvironmentObject var signinStore: SignInStore
    @Environment(\.dismiss) private var dismiss
    
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var newPasswordCheck: String = ""
    @State private var isShowingAlert: Bool = false
    @State private var isDisabled: Bool = true
    @State private var isCheckPassword: Bool = false
    
    private var currentUser: User {
        myUserStore.currentUser
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("현재 비밀번호")
                    .font(.captionRegular)
                    .foregroundColor(.myDarkGray)
                
                TextField("현재 비밀번호 입력", text: $currentPassword)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isDisabled ? .white : .myLightGray)
                    .cornerRadius(10)
                    .disabled(!isDisabled)
                    .onChange(of: currentPassword) { newValue in
                        if newValue == myUserStore.currentUser.password {
                            isDisabled = false
                        }
                    }
            }
            
            VStack(alignment: .leading) {
                Text("새 비밀번호")
                    .font(.captionRegular)
                    .foregroundColor(.myDarkGray)
                TextField("새 비밀번호 입력", text: $newPassword)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .disabled(isDisabled)
                    .background(isDisabled ? Color.myLightGray : .white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isCheckPassword ? Color.green : .myLightGray, lineWidth: 3)
                    )
                    .onChange(of: newPassword) { newValue in
                        if !newValue.isEmpty && newValue == newPasswordCheck {
                            isCheckPassword = true
                        } else {
                            isCheckPassword = false
                        }
                    }
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                Text("비밀번호 확인")
                    .font(.captionRegular)
                    .foregroundColor(.myDarkGray)
                TextField("새 비밀번호 확인", text: $newPasswordCheck)
                    .frame(maxWidth: .infinity)
                    .disabled(isDisabled)
                    .padding()
                    .background(isDisabled ? Color.myLightGray : .white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isCheckPassword ? Color.green : .myLightGray, lineWidth: 3)
                    )
                    .cornerRadius(10)
                    .onChange(of: newPasswordCheck) { newValue in
                        if !newValue.isEmpty && newValue == newPassword {
                            isCheckPassword = true
                        } else {
                            isCheckPassword = false
                        }
                    }
            }
            Spacer()
            Button{
                myUserStore.currentUser.password = newPasswordCheck
                Task {
                    try await myUserStore.editAccount(user: currentUser)
                    await signinStore.changePassword(password: newPasswordCheck)
                }

                isShowingAlert.toggle()
            }label: {
                Text("변경")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(isCheckPassword ? Color.myBrown : Color.myLightGray)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    
            }
            .disabled(!isCheckPassword)
            .buttonStyle(.automatic)
            .tint(.myBrown)
        }
        .padding(20)
        .navigationTitle("비밀번호 변경")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .alert("비밀번호가 변경되었습니다.", isPresented: $isShowingAlert) {
            Button("확인", role: .none) { dismiss() }
        }
    }
}

struct PasswordEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PasswordEditView()
        }
    }
}
