//
//  PasswordEditView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct PasswordEditView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var newPasswordCheck: String = ""
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        VStack {
            //Logo 자리
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: min(250, UIScreen.main.bounds.width * 0.3), height: min(250, UIScreen.main.bounds.width * 0.3))
                    .foregroundColor(.myPrimary)
                Text("Logo")
                    .foregroundColor(.myWhite)
            }
            .padding(.vertical, 70)
            
            VStack(alignment: .leading) {
                Text("현재 비밀번호")
                    .font(.captionRegular)
                    .foregroundColor(.myDarkGray)
                TextField("현재 비밀번호 입력", text: $currentPassword)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.bottom, 50)
            
            VStack(alignment: .leading) {
                Text("새 비밀번호")
                    .font(.captionRegular)
                    .foregroundColor(.myDarkGray)
                TextField("영문 8자리 이상", text: $newPassword)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                Text("비밀번호 확인")
                    .font(.captionRegular)
                    .foregroundColor(.myDarkGray)
                TextField("영문 8자리 이상", text: $newPasswordCheck)
                    .textFieldStyle(.roundedBorder)
            }
            Spacer()
            Button{
                isShowingAlert.toggle()
            }label: {
                Text("변경")
                    .bold()
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .buttonStyle(.borderedProminent)
            .tint(.myPrimary)
        }
        .padding(.horizontal, 20)
        .navigationTitle("비밀번호 변경")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
        }
        .alert("비밀번호 변경", isPresented: $isShowingAlert) {
            Button("취소", role: .cancel) {}
            Button("변경", role: .destructive) {
                //TODO: 비밀번호 변경 로직
                dismiss()
            }
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
