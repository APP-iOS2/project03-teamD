//
//  View+Extension.swift
//  
//
//  Created by 방유빈 on 2023/09/06.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct MyBackground: ViewModifier {

    func body(content: Content) -> some View {
        ZStack {
            Color.myBackground.ignoresSafeArea(.all)
            content
                .scrollContentBackground(.hidden)
        }
    }
}

@available(iOS 16.0, *)
public extension View {
    func customBackground() -> some View {
        modifier(MyBackground())
    }
}
