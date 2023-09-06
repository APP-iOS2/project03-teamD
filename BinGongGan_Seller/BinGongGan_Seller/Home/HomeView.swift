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
                CategoryButtonsView(categoryModel: CategoryModel())
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
                    Button(action: {
                        self.isPresentedModal = true
                    },
                           label: {
                        ReservationCell()
                            .sheet(isPresented: self.$isPresentedModal) {
                                ReservationListModalView()
                                    .presentationDetents([.medium])
                                    .cornerRadius(15)
                            }
                    })
                    .buttonStyle(.plain)
                    .overlay(
                        Button(action: {
                        }) {
                            Text("예약확정")
                                .font(.subheadline)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.myWhite)
                                .foregroundColor(.myPrimary)
                                .cornerRadius(10)
                        }
                            .buttonStyle(.plain)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 40)
                    )
                }
            }
        }
        .background(Color.myBackground)
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

