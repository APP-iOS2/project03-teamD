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
                
                NavigationLink(destination: MyInfoView()) {
                    Text("수정")
                        .foregroundColor(.white)
                        .bold()
                }
            } //: HStack
            
            Divider()
                .background(.white)
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.white)
                Text("010 - 1111 - 1111")
                    .foregroundColor(.white)
                    .bold()
            } //: HStack
            
            Divider()
                .background(.white)
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
        .background(Color.myBrown)
        .cornerRadius(15)
        .padding([.bottom, .leading, .trailing])
    }
}


struct SellerInformationCell_Previews: PreviewProvider {
    static var previews: some View {
        SellerInformationCell()
    }
}
