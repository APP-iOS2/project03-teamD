//
//  LoginPasswordTextFieldView.swift
//  BinGongGan_User
//
//  Created by 박지현 on 2023/09/06.
//

import SwiftUI

struct LoginPasswordTextFieldView: View {
    
    var backgroundColor: Color = .white
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocused ? Color.myPrimary : Color.clear, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(backgroundColor))
            SecureField(placeholder, text: $text)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .font(.captionRegular)
                .foregroundColor(.black)
                .focused($isFocused)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            if isFocused {
                HStack {
                    Spacer()
                    Button(action: {
                        text = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.myPrimary)
                    }).padding(.trailing, 20)
                }
            }
        }.frame(minHeight: 47, maxHeight: 57)
    }
}


struct LoginPasswordTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPasswordTextFieldView(placeholder: "", text: .constant(""))
    }
}
