//
//  MyInformationAccountSettingView.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct UserAccountSettingView: View {
    @State private var isPresentedAlert: Bool = false
    @EnvironmentObject var myUserStore: MyUserStore
    @EnvironmentObject var signInStore: SignInStore
    
    var body: some View {
        List {
            NavigationLink {
                PasswordEditView()
            } label: {
                Text("비밀번호 변경")
            }
            
            Section {
                Button {
                    isPresentedAlert.toggle()
                } label: {
                    Text("회원탈퇴")
                        .foregroundColor(.red)
                }
                .alert("회원탈퇴", isPresented: $isPresentedAlert) {
                    Button("돌아가기", role: .cancel) { }
                    Button("탈퇴", role: .destructive) {
                        Task {
                            try await myUserStore.deleteUser()
                            signInStore.deleteUser()
                            signInStore.signOut()
                        }
                    }
                } message: {
                    Text("이 동작은 되돌릴 수 없습니다.")
                }
            }
        }
        .padding(.top, -20)
        .navigationTitle("계정 관리")
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .customBackbutton()
    }
}

struct AccountSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserAccountSettingView()
        }
    }
}
