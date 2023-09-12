//
//  CustomTextField.swift
//  BinGongGan_User
//
//  Created by 마경미 on 05.09.23.
//

import SwiftUI

// MARK: 커스텀 텍스트필드
// 플레이스홀더(힌트메세지), 키보드타입, 텍스트를 선언해줄 수 있다.
// 키보드타입은 default가 기본으로, 특정 타입이 있다면 슈퍼뷰에서 넘겨준다.
// 자동대문자화 false, 자동 수정 false 처리

@available(iOS 15.0, *)
public struct CustomTextField: View {
    var maxLength: Int = 100
    var backgroundColor: Color = .white
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    public init(maxLength: Int = 100, backgroundColor: Color = .white, placeholder: String, keyboardType: UIKeyboardType = .default, text: Binding<String>, isFocused: Bool = false) {
        self.maxLength = maxLength
        self.backgroundColor = backgroundColor
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self._text = text
        self.isFocused = isFocused
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocused ? Color.myBrown : Color.clear, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(backgroundColor))
            TextField(placeholder, text: $text)
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
struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholder: "ㅎㅎ", text: .constant(""))
    }
}
