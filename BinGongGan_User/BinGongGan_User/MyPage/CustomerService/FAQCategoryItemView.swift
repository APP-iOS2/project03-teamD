//
//  FAQCategoryItemView.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct FAQCategoryItemView: View {
    @Binding var selectedItem: String
    var scrollViewProxy: ScrollViewProxy
    
    var body: some View {
        HStack {
            ForEach(FAQCategory.allCases, id: \.self) { category in
                Button {
                    selectedItem = category.rawValue
                    withAnimation {
                        scrollViewProxy.scrollTo(category, anchor: .center)
                    }
                } label: {
                    Text("\(category.rawValue)")
                        .font(.body1Regular)
                        .foregroundColor(selectedItem == category.rawValue ? .white : .myBrown)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(selectedItem == category.rawValue ? Color.myBrown : Color.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.automatic)
                .padding(.horizontal, 5)
            }
        }
    }
}
