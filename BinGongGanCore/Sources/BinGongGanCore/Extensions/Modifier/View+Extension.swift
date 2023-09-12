//
//  File.swift
//  
//
//  Created by 방유빈 on 2023/09/07.
//

import SwiftUI

/* 이전 툴바랑 백버튼 히든 들어갔던 자리에 .customBackbutton()
 액션을 넘겨야할 시
 .customBackbutton {
    print("Action")
 }
 */

// CustomBackButton의 dismiss 사용으로 15이상
@available(iOS 15.0, *)
extension View {
    public func customBackbutton(action: (() -> ())? = nil) -> some View {
        modifier(CustomBackButton(action: action))
    }
    
    // MARK: 키보드 올라온 상태에서, 빈공간 터치시 키보드 내리는 코드
    // 키보드를 내리고싶은 뷰에서 .onTapGesture { self.endTextEditing() } 추가
    public func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    // MARK: 토스트 메세지
    // 토스트 메세지를 띄우고싶은 뷰에서 .toast(isShowing: $showToast, message: message) 추가
    public func toast(isShowing: Binding<Bool>, message: String) -> some View {
        self.modifier(ToastMessageModifier(isShowing: isShowing, message: message))
    }
}
