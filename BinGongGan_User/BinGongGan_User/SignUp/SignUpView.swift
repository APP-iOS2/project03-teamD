//
//  SignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 05.09.23.
//

import SwiftUI

struct SignUpView: View {
    @State var text: String = ""
    var body: some View {
        CustomTextField(placeholder: "이메일", keyboardType: .emailAddress, text: $text)
            .frame(height: 47)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
