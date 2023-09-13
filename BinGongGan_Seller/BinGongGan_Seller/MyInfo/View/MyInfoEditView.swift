//
//  MyInfoEditView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

enum EditType: CaseIterable {
    case nickName
    case phoneNumber
    case accountNumber
    
    var message: String {
        switch self {
        case .nickName:
            return "닉네임"
        case .phoneNumber:
            return "연락처"
        case .accountNumber:
            return "계좌번호"
        }
    }
}

struct MyInfoEditView: View {
    @Environment(\.dismiss) private var dismiss
    
    private var isButtonDisabled: Bool {
        if editType == .nickName {
            return newName.isEmpty || nickName == newName
        } else if editType == .phoneNumber {
            return newPhoneNumber.isEmpty || phoneNumber == newPhoneNumber
        } else {
            return newAccountNumber.isEmpty || accountNumber == newAccountNumber
        }
    }
    var editType: EditType
    
    @Binding var nickName: String?
    @Binding var phoneNumber: String?
    @Binding var accountNumber: String?
    @State private var newName: String = ""
    @State private var newPhoneNumber: String = ""
    @State private var newAccountNumber: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("\(editType.message)정보는 호스트에게 보여집니다.")
                    .font(.captionRegular)
                    .foregroundColor(.myMediumGray)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            
            if editType == .nickName {
                CustomTextField(placeholder: nickName, text: $newName)
                    .frame(height: 40)
                    .padding(.horizontal, 20)
            } else if editType == .phoneNumber {
                CustomTextField(placeholder: phoneNumber, text: $newPhoneNumber)
                    .keyboardType(.numberPad)
                    .frame(height: 40)
                    .padding(.horizontal, 20)
            } else {
                CustomTextField(placeholder: accountNumber, text: $newAccountNumber)
                    .keyboardType(.numberPad)
                    .frame(height: 40)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            Button {
                if editType == .nickName {
                    nickName = newName
                } else if editType == .phoneNumber {
                    phoneNumber = newPhoneNumber
                } else {
                    accountNumber = newAccountNumber
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
        .navigationTitle("\(editType.message) 수정")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .onAppear {
            newName = nickName
            newPhoneNumber = phoneNumber
            newAccountNumber = accountNumber
        }
    }
}

struct MyInfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoEditView(editType: .nickName, nickName: .constant("닉네임"), phoneNumber: .constant("010-1234-1234"), accountNumber: .constant("123456-12-123456"))
    }
}
