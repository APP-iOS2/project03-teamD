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
                Text("차은우")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                
                NavigationLink(destination: MyInfoVIew()) {
                    Text("수정")
                        .foregroundColor(.white)
                        .bold()
                }
            } //: HStack
            
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.white)
                Text("010 - 1111 - 1111")
                    .foregroundColor(.white)
                    .bold()
            } //: HStack
            
            VStack {
                HStack {
                    Image(systemName: "creditcard.fill")
                        .foregroundColor(.white)
                    Text("국민 46390204174780 (빵유빈)")
                        .foregroundColor(.white)
                        .bold()
                } //: VStack
            } //: HStack
        }
        .padding(20)
        .background(Color.brown)
        .cornerRadius(15)
        .padding()
    }
}


struct SellerInformationCell_Previews: PreviewProvider {
    static var previews: some View {
        SellerInformationCell()
    }
}
