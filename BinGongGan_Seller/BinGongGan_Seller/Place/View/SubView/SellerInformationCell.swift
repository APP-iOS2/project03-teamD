//
//  SellerInformationCell.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct SellerInformationCell: View {
    var seller: Seller
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Spacer()
                Text("대표")
                Text("\(seller.name)")
                    .bold()
            } //: HStack
            
            Divider()
                .frame(minHeight: 3)
                .background(Color.myBrown)
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Mobile")
                    Spacer()
                    Text("\(seller.phoneNumber)")
                }
                HStack {
                    Text("E-mail")
                    Spacer()
                    Text("\(seller.email)")
                        .accentColor(.black)
                }
                HStack {
                    Text("Acc No.")
                    Spacer()
                    Text("국민 \(seller.accountNumber)")
                }
                HStack {
                    Text("EID")
                    Spacer()
                    Text("사업자 등록 번호 \(seller.registrationNum)")
                }
            }
        }
        .padding(20)
        .background(.white)
        .cornerRadius(15)
    }
}


struct SellerInformationCell_Previews: PreviewProvider {
    static var previews: some View {
        SellerInformationCell(
            seller:
                Seller(
                    id: "",
                    name: "",
                    birthDate: "",
                    phoneNumber: "",
                    email: "",
                    nickname: "",
                    password: "",
                    bankName: "",
                    accountNumber: "",
                    registrationNum: "",
                    registrationImage: "")
        )
    }
}
