//
//  MyInformationAccountSettingView.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct AccountSettingView: View {
    @State private var isPresentedAlert: Bool = false
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
                    Button("탈퇴", role: .destructive) { }
                } message: {
                    Text("이 동작은 되돌릴 수 없습니다.")
                }
            }
        }
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
            AccountSettingView()
        }
    }
}
