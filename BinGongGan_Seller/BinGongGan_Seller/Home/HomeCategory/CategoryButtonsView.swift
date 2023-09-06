//
//  CategoryButtonsView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct CategoryButtonsView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    let categoryList = CategoryModel.data
 
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(categoryList) { category in
                NavigationLink {
                    category.anyView
                } label: {
                    CategoryButton(category: category)
                }
            }
        }
        .padding()
        .background(Color.myWhite)
        .cornerRadius(15)
        .frame(maxHeight: .infinity)
    }
}

struct CategoryButtonsViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoryButtonsView()
        }
    }
}