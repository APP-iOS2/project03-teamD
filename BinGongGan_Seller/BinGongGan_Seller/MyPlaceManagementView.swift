//
//  MyPlaceManagementView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI

struct MyPlaceManagementView: View {
    // MARK: - PROPERTY
    
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Section {
                    Text("차은우")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                Image(systemName: "phone")
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text("010-1234-5678")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                }
            }
            .padding()
            .background(Color.gray)
            .frame(width: 500, height: 500, alignment: .center)
        }
    }
}

struct MyPlaceManagementView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaceManagementView()
    }
}
