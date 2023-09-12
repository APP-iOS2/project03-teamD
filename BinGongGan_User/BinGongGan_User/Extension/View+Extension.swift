//
//  File.swift
//  BinGongGan_User
//
//  Created by 마경미 on 07.09.23.
//

import SwiftUI

extension View {
    func customSection(_ text: String) -> some View {
        VStack(alignment: .leading) {
            Text(text)
            Rectangle()
                .fill(Color.myLightGray)
                .frame(height: 2)
        }
    }
}
