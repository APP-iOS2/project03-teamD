//
//  HomeView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct HomeView: View {
    
    @EnvironmentObject private var rervationStore : RervationStore
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            ScrollView {
                HStack{
                    Text("전체 메뉴")
                        .font(.head1Bold)
                        .padding([.top, .leading], 20)
                        .foregroundColor(Color.black)
                    Spacer()
                }
                
                CategoryButtonsView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                
                HStack{
                    Text("신규 예약")
                        .font(.head1Bold)
                        .padding(.leading, 20)
                        .foregroundColor(Color.black)
                    Spacer()
                }
                if rervationStore.recentData.count > 0{
                    ForEach(0..<min(5, rervationStore.recentData.count), id: \.self) { index in
                        ReservationCell(data:rervationStore.recentData[index],isHiddenRightButton: true)
                            .environmentObject(rervationStore)
                            .padding(.bottom, 12)
                            .padding(.horizontal, 20)
                    }
                } else {
                    Text("신규 예약이 없습니다.")
                        .font(.title)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Image("HomeLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        Text("BinGongGan")
                            .bold()
                            .foregroundColor(Color.myBrown)
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 0))
                }
            }
            .background(Color.myBackground)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView().environmentObject(RervationStore())
        }
    }
}
