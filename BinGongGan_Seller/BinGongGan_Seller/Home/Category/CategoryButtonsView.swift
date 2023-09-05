//
//  SimpleButtonView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI

struct CategoryButtonsView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0..<8) { _ in
                CategoryButton()
            }
        }
        .padding()
        .background(Color.green)
        .cornerRadius(15)
        .frame(maxHeight: .infinity)
    }
}

struct CategoryButtonsViewPreviews: PreviewProvider {
    static var previews: some View {
        CategoryButtonsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
