//
//  CustomTextEditor.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/12.
//

import SwiftUI
import BinGongGanCore

// MARK: 커스텀 텍스트필드
// 플레이스홀더(힌트메세지), 키보드타입, 텍스트를 선언해줄 수 있다.
// 키보드타입은 default가 기본으로, 특정 타입이 있다면 슈퍼뷰에서 넘겨준다.
// 자동대문자화 false, 자동 수정 false 처리
struct CustomTextEditor: View {
    var maxLength: Int = 500
    var backgroundColor: Color = .white
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocused ? Color.myBrown : Color.clear, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(backgroundColor))
            TextEditor(text: $text)
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
        .frame(minHeight: 200, maxHeight: 300)
        .onChange(of: text, perform: { newValue in
            if newValue.count > maxLength {
                text = String(newValue.prefix(maxLength))
                isFocused = false
            }
        })
    }
}

struct CustomTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextEditor(text: .constant(""))
    }
}
