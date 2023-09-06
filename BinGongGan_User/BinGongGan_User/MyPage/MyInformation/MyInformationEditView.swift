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
                Text("이름 수정")
                Spacer()
            }
            .font(.head1Bold)
            .padding(.leading, 20)
            
            HStack {
                Text("이름 정보는 호스트에게 보여지는 이름입니다.")
                    .font(.captionRegular)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, 10)
            
            TextField("", text: $name)
                .textFieldStyle(CommonTextfieldStyle(name: $name))
                .padding(.horizontal, 20)
            
            Spacer()
        }
        .background(Color.myBackground)
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

struct CommonTextfieldStyle: TextFieldStyle {
    @Binding var name: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.myPrimary, lineWidth: 1)
                .frame(height: 50)
            HStack {
                Text("이름")
                    .padding([.bottom, .leading])
                    .font(.caption2)
                    .foregroundColor(.myDarkGray)
                Spacer()
                
                if !name.isEmpty {
                    Button {
                        name = ""
                    } label: {
                        Image(systemName: "xmark")
                            .font(.head1Regular)
                            .padding(.trailing)
                            .foregroundColor(.myPrimary)
                    }
                }
            }
            
            // 텍스트필드
            configuration
                .font(.body1Regular)
                .padding(.leading)
                .padding(.top)
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
