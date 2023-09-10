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
    
    public func toast(isShowing: Binding<Bool>, message: String) -> some View {
        self.modifier(ToastMessageModifier(isShowing: isShowing, message: message))
    }
}
