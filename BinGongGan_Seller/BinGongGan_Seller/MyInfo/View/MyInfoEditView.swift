//
//  MyInfoEditView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct MyInfoEditView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var myInfoStore: MyInfoStore
    var editType: EditType
    
    var body: some View {
        VStack {
            HStack {
                Text("\(myInfoStore.editType.name)정보는 호스트에게 보여집니다.")
                    .font(.captionRegular)
                    .foregroundColor(.myMediumGray)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            
            switch myInfoStore.editType {
            case .nickName:
                CustomTextField(placeholder: myInfoStore.myInfo.nickname, text: $myInfoStore.myInfo.nickname)
                    .frame(height: 40)
                    .padding(.horizontal, 20)
                
            case .phoneNumber:
                CustomTextField(placeholder: myInfoStore.myInfo.phoneNumber, text: $myInfoStore.myInfo.phoneNumber)
                    .keyboardType(.numberPad)
                    .frame(height: 40)
                    .padding(.horizontal, 20)
                
            case .accountNumber:
                CustomTextField(placeholder: myInfoStore.myInfo.accountNumber, text: $myInfoStore.myInfo.accountNumber)
                    .keyboardType(.numberPad)
                    .frame(height: 40)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            Button {
                Task {
                    await myInfoStore.updateData()
                }
                dismiss()
            } label: {
                Text("완료")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(myInfoStore.isButtonDisabled ? Color.myLightGray : Color.myBrown)
                    .cornerRadius(15)
                    .padding(20)
                    .foregroundColor(.white)
            }
            .buttonStyle(.automatic)
            .disabled(myInfoStore.isButtonDisabled)
        }
        .background(Color.myBackground)
        .navigationTitle("\(myInfoStore.editType.name) 수정")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .onAppear {
            myInfoStore.editType = editType
        }
    }
}

struct MyInfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoEditView(editType: .nickName)
    }
}
