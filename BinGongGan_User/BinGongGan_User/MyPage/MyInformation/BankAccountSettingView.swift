//
//  BankAccountSettingView.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct BankAccountSettingView: View {
    @State private var bank: Bank?
    @State private var isPresentedSelectBankSheet: Bool = false
    @State private var isPresentedNumberEditSheet: Bool = false
    @State private var isSelectedBank: Bool = false
    @State private var isClickedEditBankButton: Bool = false
    
    let currentUser: User
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: currentUser.bank?.imageString ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 25, maxHeight: 25)
                            .clipShape(Circle())
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text("\(currentUser.bank?.name ?? "")")
                        .font(.body1Bold)
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            isPresentedSelectBankSheet = true
                        } label: {
                            Text("수정")
                                .font(.captionRegular)
                                .foregroundColor(.myMediumGray)
                                .underline()
                        }
                        .buttonStyle(.plain)
                    }
                }
                HStack {
                    Text("\(currentUser.accountNumber ?? "")")
                        .font(.captionBold)
                        .foregroundColor(.myMediumGray)
                    Divider()
                        .frame(width: 1, height: 15)
                        .background(Color.myLightGray)
                    Text("\(currentUser.accountHolder ?? "")")
                        .font(.captionRegular)
                        .foregroundColor(.myMediumGray)
                }
            }
        }
        .padding(.top, -20)
        .navigationTitle("계좌 관리")
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .customBackbutton()
        .onAppear {
            bank = currentUser.bank
        }
        .sheet(isPresented: $isPresentedSelectBankSheet) {
            if isSelectedBank {
                isPresentedNumberEditSheet = true
            }
        } content: {
            NavigationStack {
                BankSelectView(isPresentedSelectBankSheet: $isPresentedSelectBankSheet, isSelectedBank: $isSelectedBank, selectedBank: $bank)
            }
            .presentationCornerRadius(20)
            .presentationDetents([.fraction(0.5)])
        }
        .sheet(isPresented: $isPresentedNumberEditSheet) {
            if isClickedEditBankButton {
                isPresentedSelectBankSheet = true
            }
        } content: {
            NavigationStack {
                AccountEditView(bank: $bank, isClickedEditBankButton: $isClickedEditBankButton)
            }
            .presentationCornerRadius(20)
            .presentationDetents([.fraction(0.7)])
            .interactiveDismissDisabled()
        }
    }
}

struct BankAccountSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BankAccountSettingView(currentUser: User(id: "", email: "", name: "손윤호", nickname: "", phoneNumber: "", password: "", birthDate: "",accountNumber: "33331612345678", accountBank: "카카오뱅크", accountHolder: "손윤호"))
        }
    }
}
