//
//  SellerListView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct SellerListView: View {
    @StateObject private var sellerStore: SellerStore = SellerStore()
    
    var body: some View {
        List(sellerStore.sellerList) { seller in
            NavigationLink {
                SellerDetailView(sellerStore: sellerStore, seller: seller)
            } label: {
                VStack(alignment: .leading) {
                    Text(seller.name)
                        .font(.head1Bold)
                    Text("\(seller.nickname)")
                        .font(.captionRegular)
                        .foregroundColor(.myDarkGray)
                }
            }
            
        }
        .tint(.myMint)
        .navigationTitle("판매자")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .onAppear {
            Task {
                try await sellerStore.fetchSeller()
            }
        }
    }
}

struct SellerListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SellerListView()
        }
    }
}
