//
//  CustomTextField.swift
//  BinGongGan_User
//
//  Created by 마경미 on 05.09.23.
//

import SwiftUI
import BinGongGanCore

// MARK: 커스텀 텍스트필드
// 플레이스홀더(힌트메세지), 키보드타입, 텍스트를 선언해줄 수 있다.
// 키보드타입은 default가 기본으로, 특정 타입이 있다면 슈퍼뷰에서 넘겨준다.
// 자동대문자화 false, 자동 수정 false 처리
struct CustomTextField: View {
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocused ? Color.myPrimary : Color.clear, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white))
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
                            .foregroundColor(.myPrimary)
                    }).padding(.trailing, 20)
                }
            }
        }
    }
}
struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholder: "", text: .constant(""))
    }
}
