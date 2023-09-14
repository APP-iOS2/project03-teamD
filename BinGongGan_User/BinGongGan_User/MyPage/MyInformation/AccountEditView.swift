//
//  AccountNumberEditView.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/12.
//

import SwiftUI
import BinGongGanCore

struct AccountEditView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var myUserStore: MyUserStore
    @Binding var bank: Bank?
    @Binding var isClickedEditBankButton: Bool
    @State private var accountNumber: String = ""
    
    private var isDisabled: Bool {
        return accountNumber.isEmpty || accountNumber.count < 7
    }
    
    var body: some View {
        //TODO: 계좌 번호 입력 폼
        VStack {
            HStack {
                AsyncImage(url: URL(string: bank?.imageString ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 35, maxHeight: 35)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                Text("\(bank?.name ?? "")")
                    .font(.body1Bold)
                
                Button {
                    
                    dismiss()
                    isClickedEditBankButton = true
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.myMediumGray)
                }
                .buttonStyle(.plain)
                
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, 10)
            
            AccountNumberEditView(inputText: $accountNumber)
            
            Button {
                myUserStore.currentUser.accountBank = bank?.name
                myUserStore.currentUser.accountNumber = accountNumber
                Task {
                    try await myUserStore.editAccount(user: myUserStore.currentUser)
                }
                dismiss()
            } label: {
                Text("확인")
                    .font(.body1Bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(isDisabled ? Color.myLightGray : Color.myBrown)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .disabled(isDisabled)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("취소")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct AccountEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AccountEditView(bank: .constant(Bank(name: "카카오뱅크", imageString: "https://play-lh.googleusercontent.com/HTBCHqXZ01RhNVzIDwsA2ARURfzXeHxoWfsmgH92ieCgIG1CuPpJRWqCfJ9KgkwWStko")), isClickedEditBankButton: .constant(false))
                .environmentObject(MyUserStore())
        }
    }
}
