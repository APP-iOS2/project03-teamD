//
//  AgreementCheckButton.swift
//  BinGongGan_User
//
//  Created by 마경미 on 07.09.23.
//

import SwiftUI

struct AgreementCheckButton: View {
    @Binding var agreement: Bool
    var text: String

    var body: some View {
        HStack {
            Button(action: {
                agreement.toggle()
            }, label: {
                HStack {
                    Image(systemName: agreement ? "checkmark.circle.fill" : "checkmark.circle")
                        .resizable()
                        .foregroundColor(.myMint)
                        .frame(width: 24, height: 24)
                    Text(text)
                }
            }).buttonStyle(.plain)
                .font(.body1Regular)
                .frame(height: 24)
            Spacer()
        }
    }
}

struct AgreementCheckButton_Previews: PreviewProvider {
    static var previews: some View {
        AgreementCheckButton(agreement: .constant(true), text: "동의합니다")
    }
}
