//
//  Text+Extension.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

extension Text {
    func buttonStyle(backgroundColor: Color) -> some View {
        self.padding()
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(15)
            .foregroundColor(.white)
    }
}

