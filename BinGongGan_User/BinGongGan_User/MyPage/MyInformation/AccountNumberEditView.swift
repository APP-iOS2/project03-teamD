//
//  AccountNumberEditView.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct AccountNumberEditView: View {
    @Binding var inputText: String
    
    var numbers = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["", "0", "arrow.backward"]]
    
    var body: some View {
        VStack {
            AccountTextFieldView(accountNumber: $inputText)
                .padding(.horizontal, 20)
                .padding(.vertical)
            
            ForEach(numbers, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { number in
                        Button {
                            if number == "arrow.backward" {
                                if !inputText.isEmpty {
                                    inputText.removeLast()
                                }
                            } else {
                                inputText += number
                            }
                        } label: {
                            if number == "arrow.backward" {
                                Image(systemName: number)
                                    .padding(.vertical, 10)
                                    .fixedSize()
                                    .frame(maxWidth: .infinity)
                            } else {
                                Text("\(number)")
                                    .padding(.vertical, 10)
                                    .fixedSize()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
            }
            .font(.head1Bold)
            .foregroundColor(.black)
        }
    }
}

struct AccountNumberEditView_Previews: PreviewProvider {
    static var previews: some View {
        AccountNumberEditView(inputText: .constant(""))
    }
}

