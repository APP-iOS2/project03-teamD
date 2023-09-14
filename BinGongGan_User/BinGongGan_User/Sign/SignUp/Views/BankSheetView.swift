//
//  BankSheetView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 12.09.23.
//

import SwiftUI

struct BankSheetView: View {
    @Binding var isShowingSheet: Bool
    @Binding var selectedBank: String?
    var body: some View {
        List(Bank.banks) { bank in
            Button(action: {
                selectedBank = bank.name
                isShowingSheet = false
            }, label: {
                HStack {
                    AsyncImage(url: URL(string: bank.imageString), content: { image in
                        image
                            .resizable()
                            .frame(width:36, height: 36)
                    }, placeholder: {
                        ProgressView()
                    })
                    Text(bank.name)
                        .frame(height:40)
                }.padding(.horizontal, 20)
            })
        }.listStyle(.plain)
    }
}

struct BankSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BankSheetView(isShowingSheet: .constant(false), selectedBank: .constant(""))
    }
}
