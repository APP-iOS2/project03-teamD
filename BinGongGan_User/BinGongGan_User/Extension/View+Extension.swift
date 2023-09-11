//
//  File.swift
//  BinGongGan_User
//
//  Created by 마경미 on 07.09.23.
//

import Foundation
import SwiftUI

extension View {
    // MARK: 키보드 올라온 상태에서, 빈공간 터치시 키보드 내리는 코드
    // 키보드를 내리고싶은 뷰에서 .onTapGesture { self.endTextEditing() } 추가
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func toast(isShowing: Binding<Bool>, message: String) -> some View {
        self.modifier(ToastMessageModifier(isShowing: isShowing, message: message))
    }
    
    func customSection(_ text: String) -> some View {
        VStack(alignment: .leading) {
            Text(text)
            Rectangle()
                .fill(Color.myLightGray)
                .frame(height: 2)
            //                .opacity(0.6)
        }
    }
}
