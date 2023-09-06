//
//  ReviewManageDetailView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI

struct ReviewManageDetailView: View {
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            ScrollView {
                ReservationCell()
                
                ReviewCell()
                    .padding()
                
                Spacer()
                
                Button("리뷰 신고하기", role: .destructive) {
                    
                }
            }
            .navigationTitle("리뷰 관리")
        }
    }
}

struct ReviewManageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewManageDetailView()
        }
    }
}
