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
        Rectangle()
            .fill(Color.myWhite)
            .frame(width: AnnouncementOptionCell.screenWidth * 0.19, height: AnnouncementOptionCell.screenWidth * 0.21)
            .cornerRadius(15)
            .overlay(
                VStack{
                    Image(category.imageString)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: AnnouncementOptionCell.screenWidth * 0.08, height: AnnouncementOptionCell.screenHeight * 0.05)
                        .scaleEffect(0.8)
                    Text(category.categories)
                        .font(.footnote)
                        .bold()
                }
            )
            .foregroundColor(Color.myPrimary)
    }
}


struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(category: CategoryModel.data[0])
    }
}
