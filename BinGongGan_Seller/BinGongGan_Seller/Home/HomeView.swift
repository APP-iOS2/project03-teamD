//
//  HomeView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct HomeView: View {
    @State private var isPresentedModal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack{
                        Text("전체 메뉴")
                            .font(.title2)
                            .bold()
                            .padding([.top, .leading], 20)
                            .foregroundColor(Color.myDarkGray)
                        Spacer()
                    }
                    CategoryButtonsView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding([.leading, .trailing, .bottom], 20)
                    HStack{
                        Text("신규 예약")
                            .font(.title2)
                            .bold()
                            .padding(.leading, 20)
                            .foregroundColor(Color.myDarkGray)
                        Spacer()
                    }
                    ForEach(0..<5) { _ in
                        Button{
                            self.isPresentedModal = true
                        } label: {
                            ReservationCell()
                                .sheet(isPresented: self.$isPresentedModal) {
                                    ReservationListModalView()
                                        .presentationDetents([.medium])
                                        .cornerRadius(15)
                                }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .background(Color.myBackground)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
