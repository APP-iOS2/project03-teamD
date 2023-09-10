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
    private var isButtonDisabled: Bool {
        if editType == .name {
            return newName.isEmpty || name == newName
        } else {
            return newPhoneNumber.isEmpty || phoneNumber == newPhoneNumber
        }
    }
    var editType: EditType
    
    @Binding var name: String
    @Binding var phoneNumber: String
    @State private var newName: String = ""
    @State private var newPhoneNumber: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("\(editType == .name ? "이름 정보는 호스트에게 보여집니다." : "연락처 정보는 호스트에게 보여집니다.")")
                    .font(.captionRegular)
                    .foregroundColor(.myMediumGray)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            
            if editType == .name {
                CustomTextField(placeholder: name, text: $newName)
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
                    name = newName
                } else {
                    phoneNumber = newPhoneNumber
                }
                dismiss()
            } label: {
                Text("완료")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(isButtonDisabled ? Color.myLightGray : Color.myPrimary)
                    .cornerRadius(15)
                    .padding(20)
                    .foregroundColor(.myWhite)
            }
            .buttonStyle(.automatic)
            .disabled(isButtonDisabled)
        }
        .background(Color.myBackground)
        .navigationTitle("\(editType == .name ? "이름 수정": "연락처 수정")")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .onAppear {
            newName = name
            newPhoneNumber = phoneNumber
        }
    }
}

struct MyInformationEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInformationEditView(editType: .phoneNumber, name: .constant("손윤호"), phoneNumber: .constant("01012345678"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
