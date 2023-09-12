//
//  AccountTextFieldView.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct AccountTextFieldView: View {
    @Binding var accountNumber: String
    
    private let accountNumberLimit: Int = 20
    
    var body: some View {
        ZStack {
            TextField("환불 받을 계좌번호 입력", text: $accountNumber)
                .font(.head1Bold)
                .padding(20)
                .background(Color(hex: "F9F9F9"))
                .cornerRadius(10)
                .disabled(true)
            
            if !accountNumber.isEmpty {
                HStack {
                    Spacer()
                    
                    Button {
                        accountNumber = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.myBrown)
                    }
                    .padding(.trailing, 20)
                }
            }
        }
        .onChange(of: accountNumber) { newValue in
            if newValue.count > accountNumberLimit {
                accountNumber = String(newValue.prefix(accountNumberLimit))
            }
        }
    }
}

struct AccountTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTextFieldView(accountNumber: .constant(""))
    }
}
