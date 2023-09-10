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
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            NavigationStack {
                ScrollView {
                    CategoryButtonsView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(10)
                    HStack{
                        Text("신규 예약")
                            .font(.title2)
                            .bold()
                            .padding(.leading, 20)
                            .foregroundColor(Color.myDarkGray)
                        Spacer()
                    }
                    ForEach(0..<5) { _ in
                        ReservationCell()
                            .padding(.horizontal, 20)
                            .overlay(
                                VStack {
                                    Button(action: {
                                        isPresentedModal.toggle()
                                    }) {
                                        Image(systemName: "chevron.right")
                                            .background(Color.clear)
                                            .foregroundColor(Color.myPrimary)
                                    }
                                    .buttonStyle(.plain)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 40))
                                    Spacer()
                                }
                                .sheet(isPresented: self.$isPresentedModal) {
                                    ReservationDetailSheet()
                                        .presentationDetents([.medium])
                                        .cornerRadius(15)
                                }
                            )
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
                                .foregroundColor(Color.myPrimary)
                        }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 0))
                    }
                }
                .background(Color.myBackground)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
