//
//  ReviewManageView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI

struct ReviewManageView: View {
    var body: some View {
        List {
            ForEach(1...3, id: \.self) { _ in
                NavigationLink {
                    ReviewManageDetailView()
                } label: {
                    ReviewCell()
                }
            }
            .navigationTitle("리뷰 관리")
        }
    }
}

struct ReviewManageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewManageView()
        }
    }
}
