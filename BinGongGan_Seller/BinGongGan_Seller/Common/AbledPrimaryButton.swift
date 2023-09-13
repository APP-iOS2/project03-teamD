//
//  PrimaryButton.swift
//  BinGongGan_Seller
//
//  Created by 박지현 on 2023/09/11.
//

import SwiftUI

struct AbledPrimaryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.body1Bold)
                .foregroundColor(.white)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color.myBrown)
                .cornerRadius(8)
        }
    }
}

struct PirmaryButton_Previews: PreviewProvider {
    static var previews: some View {
        AbledPrimaryButton(title: "다음", action: {
            
        })
    }
}
