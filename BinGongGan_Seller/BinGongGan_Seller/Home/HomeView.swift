//
//  HomeView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Text("전체 메뉴")
                        .font(.title)
                        .bold()
                        .padding([.top, .leading], 20)
                    Spacer()
                }
                CategoryButtonsView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding([.leading, .trailing, .bottom], 20)
                HStack{
                    Text("신규 예약")
                        .font(.title)
                        .bold()
                        .padding(.leading, 20)
                    Spacer()
                }
                ForEach(0..<5) { _ in
                    ReservationCell()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
