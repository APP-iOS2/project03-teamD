//
//  SellerDetailView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct SellerDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var sellerStore: SellerStore
    @State private var isShowingAlert: Bool = false
    var seller: Seller
    
    var body: some View {
        Form {
            Section("이름 및 닉네임") {
                HStack {
                    Text("이름")
                    Spacer()
                    Text(seller.name)
                }
                HStack {
                    Text("닉네임")
                    Spacer()
                    Text(seller.nickname)
                }
            }
            Section("전화번호") {
                Text(seller.phoneNumber)
            }
            Section("email") {
                Text(seller.email)
            }
            Section("생년월일") {
                Text(seller.birthDate)
            }
            Section("사업자 등록 번호") {
                Text(seller.registrationNum)
            }
            Button {
                isShowingAlert.toggle()
            } label: {
                Text("판매자 삭제")
                    .buttonStyle(backgroundColor: Color.myBrown)
            }
            .listRowBackground(Color.myBackground)
        }
        .navigationTitle("\(seller.name) 정보")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .alert("판매자 삭제", isPresented: $isShowingAlert) {
            Button("취소", role: .cancel) {}
            Button("삭제", role: .destructive) {
                Task {
                    guard let id = seller.id else { return }
                    try await sellerStore.removeSeller(sellerId: id)
                }
                dismiss()
            }
        }message: {
            Text("해당 유저를 삭제합니다.")
        }
    }
}

struct SellerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SellerDetailView(sellerStore: SellerStore(), seller: Seller(id: "aaa", name: "seller", birthDate: "2000.01.22", phoneNumber: "01011111111", email: "email@email.com", nickname: "IWantMoney", password: "112313", bankName: "111111111", accountNumber: "1234567890", registrationNum: "", registrationImage: "국민은행"))
        }
    }
}

