//
//  CategoryButtonView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore
struct CategoryButton: View {
    
    var imageString: String
    var categoryName: String
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: UIScreen.screenWidth * 0.19, height: UIScreen.screenWidth * 0.21)
            .cornerRadius(15)
            .overlay(
                VStack{
                    Image(imageString)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.screenWidth * 0.08, height: UIScreen.screenHeight * 0.05)
                        .scaleEffect(0.8)
                    Text(categoryName)
                        .font(.footnote)
                        .foregroundColor(Color.black)
                        .bold()
                }
            )
            .foregroundColor(Color.myBrown)
    }
}


struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(imageString: CategoryName.managementReservation.imageString, categoryName: CategoryName.managementReservation.nameString)
    }
}
