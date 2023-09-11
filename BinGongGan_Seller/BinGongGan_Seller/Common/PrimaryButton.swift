//
//  PrimaryButton.swift
//  BinGongGan_Seller
//
//  Created by 박지현 on 2023/09/11.
//

import SwiftUI

struct PrimaryButton: View {
    var action: () -> Void
    var title: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.body1Bold)
                .foregroundColor(.white)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color.myPrimary)
                .cornerRadius(8)
        }
    }
}

struct PirmaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(action: {
            
        }, title: "다음")
    }
}
