//
//  ReviewManageView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReviewManageView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack {
                    ForEach(1...3, id: \.self) { _ in
                        NavigationLink {
                            ReviewManageDetailView()
                        } label: {
                            ReviewCell()
                                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        }
                    }
                    .navigationTitle("리뷰 관리")
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
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
