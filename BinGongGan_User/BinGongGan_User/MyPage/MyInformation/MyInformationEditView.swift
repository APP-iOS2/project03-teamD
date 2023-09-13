//
//  MyInformationEditView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

enum EditType {
    case name
    case phoneNumber
}

struct MyInformationEditView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var myUserStore: MyUserStore
    var currentUser: User
    
    @State var nickName: String = ""
    @State var phoneNumber: String = ""
    @State private var newNickName: String = ""
    @State private var newPhoneNumber: String = ""
    
    private var isButtonDisabled: Bool {
        if editType == .name {
            return newNickName.isEmpty || nickName == newNickName
        } else {
            return newPhoneNumber.isEmpty || phoneNumber == newPhoneNumber
        }
    }
    var editType: EditType

    var body: some View {
        VStack {
            HStack {
                Text("\(editType == .name ? "닉네임 정보는 호스트에게 보여집니다." : "연락처 정보는 호스트에게 보여집니다.")")
                    .font(.captionRegular)
                    .foregroundColor(.myMediumGray)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            
            if editType == .name {
                CustomTextField(placeholder: nickName, text: $newNickName)
                    .frame(height: 40)
                    .padding(.horizontal, 20)
            } else {
                CustomTextField(placeholder: phoneNumber, text: $newPhoneNumber)
                    .keyboardType(.numberPad)
                    .frame(height: 40)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            Button {
                if editType == .name {
                    nickName = newNickName
                    myUserStore.currentUser.nickname = nickName
                    Task {
                        try await myUserStore.editAccount(user: myUserStore.currentUser)
                    }
                } else {
                    phoneNumber = newPhoneNumber
                    myUserStore.currentUser.phoneNumber = phoneNumber
                    Task {
                        try await myUserStore.editAccount(user: myUserStore.currentUser)
                    }
                }
                dismiss()
            } label: {
                Text("완료")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(isButtonDisabled ? Color.myLightGray : Color.myBrown)
                    .cornerRadius(15)
                    .padding(20)
                    .foregroundColor(.white)
            }
            .buttonStyle(.automatic)
            .disabled(isButtonDisabled)
        }
        .background(Color.myBackground)
        .navigationTitle("\(editType == .name ? "닉네임 수정": "연락처 수정")")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .onAppear {
            nickName = currentUser.nickname
            phoneNumber = currentUser.phoneNumber
            newNickName = nickName
            newPhoneNumber = phoneNumber
        }
    }
}

struct MyInformationEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInformationEditView(currentUser: User(id: "", email: "", name: "", nickname: "", phoneNumber: "", password: "", birthDate: ""), editType: .phoneNumber)
                .environmentObject(MyUserStore())
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
