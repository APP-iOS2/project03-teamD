//
//  GongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI

struct GongGanDetailView: View {
    @StateObject var gongGan: GongGanStore = GongGanStore()
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Rectangle()
                    .frame(width: screenWidth, height: 300)
            }
            .padding(.top, 1)
            HStack {
                Button {
                    //
                } label: {
                    Label("전화", systemImage: "phone.fill")
                        .frame(width: screenWidth / 2, height: 50)
                }
                Button {
                    //
                } label: {
                    Label("예약 신청", systemImage: "phone.fill")
                        .frame(width: screenWidth / 2, height: 50)
                }
            }
        }
    }
}

struct GongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GongGanDetailView()
    }
}
