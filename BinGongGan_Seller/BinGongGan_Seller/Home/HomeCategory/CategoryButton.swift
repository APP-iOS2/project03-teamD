//
//  CategoryButtonView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore
struct CategoryButton: View {
    var category: CategoryModel
    
    var body: some View {
            VStack{
                Image(systemName: category.imageString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                Text(category.categories)
                    .font(.title3)
                    .bold()
                    .padding(.top, 5)
                Text(buttonText)
                    .font(.subheadline)
                    .bold()
                    .fixedSize()
            }

        .foregroundColor(Color.myPrimary)
        .background(Color.clear)
        .padding()
    }
}


struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(category: CategoryModel.data[0])
    }
}
