//
//  File.swift
//  
//
//  Created by 방유빈 on 2023/09/07.
//

import Foundation
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
}
