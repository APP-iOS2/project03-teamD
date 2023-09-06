//
//  MyInformationEditView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyInformationEditView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = "손윤호"
    
    var body: some View {
        VStack {
            HStack {
                Text("이름 정보는 호스트에게 보여지는 이름입니다.")
                    .font(.captionRegular)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            
            CustomTextField(placeholder: name, text: $name)
                .frame(height: 40)
                .padding(.horizontal, 20)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("완료")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.myPrimary)
                    .cornerRadius(15)
                    .padding(20)
                    .foregroundColor(.myWhite)
            }
            .buttonStyle(.automatic)
        }
        .background(Color.myBackground)
        .navigationTitle("이름 수정")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.myPrimary)
                }
            }
        }
    }
}

struct MyInformationEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInformationEditView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
