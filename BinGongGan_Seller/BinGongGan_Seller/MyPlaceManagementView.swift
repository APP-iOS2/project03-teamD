//
//  MyPlaceManagementView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI

struct MyPlaceManagementView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("판매자 정보")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 20)
                    Spacer()
                }
                SellerInformationCell()
                HStack {
                    Text("내 정보")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 20)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(1...5, id: \.self) { _ in
                            MySpaceCell()
                            
                        }
                    }
                }
            }
        }
    }
}


struct MyPlaceManagementView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaceManagementView()
    }
}
