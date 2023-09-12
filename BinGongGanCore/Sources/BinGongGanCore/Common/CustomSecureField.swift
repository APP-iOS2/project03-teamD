//
//  CustomSecurityField.swift
//  BinGongGan_User
//
//  Created by 마경미 on 07.09.23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CustomSecureField: View {
    var maxLength: Int = 8
    var placeholder: String
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    public init(maxLength: Int = 8, placeholder: String, text: Binding<String>, isFocused: Bool = false) {
        self.maxLength = maxLength
        self.placeholder = placeholder
        self._text = text
        self.isFocused = isFocused
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocused ? Color.myBrown : Color.clear, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white))
            SecureField(placeholder, text: $text)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .font(.captionRegular)
                .foregroundColor(.black)
                .focused($isFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            
            if isFocused {
                HStack {
                    Spacer()
                    Button(action: {
                        text = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.myBrown)
                    })
                    .padding(.trailing, 20)
                }
            }
        }
        .frame(minHeight: 42, maxHeight: 52)
        .onChange(of: text, perform: { newValue in
            if newValue.count > maxLength {
                text = String(newValue.prefix(maxLength))
                isFocused = false
            }
        })
    }
}

@available(iOS 15.0, *)
struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(placeholder: "비밀번호", text: .constant(""))
    }
}
