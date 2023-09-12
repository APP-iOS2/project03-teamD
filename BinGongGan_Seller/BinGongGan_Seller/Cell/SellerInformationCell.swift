//
//  SellerInformationCell.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI

struct SellerInformationCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Spacer()
                Text("대표")
                Text("차은우")
                    .bold()
            } //: HStack
            
            Divider()
                .frame(minHeight: 3)
                .background(Color.myBrown)
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Mobile")
                    Spacer()
                    Text("010-1111-1111")
                }
                HStack {
                    Text("E-mail")
                    Spacer()
                    Text("test@test.com")
                        .accentColor(.black)
                }
                HStack {
                    Text("Acc No.")
                    Spacer()
                    Text("국민 46390204174780")
                }
                HStack {
                    Text("EID")
                    Spacer()
                    Text("사업자 등록 번호")
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
        SellerInformationCell()
    }
}
