//
//  CategoryButtonView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI

struct CategoryButton: View {
    
    var body: some View {
        Button( action: {},
                label: {
            VStack{
                Image(systemName: "filemenu.and.cursorarrow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 30)
                
                Text("예약관리")
                    .font(.title3)
                    .bold()
                    .padding()
                    .fixedSize()
            }
        }).buttonStyle(.plain)
        .background(Color.clear)
        .padding()
    }
}


struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton()
    }
}
