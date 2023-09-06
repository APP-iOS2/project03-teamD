//
//  HomeView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI

struct HomeView: View {
    @State private var showModal: Bool = false
    
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
                CategoryButtonsView(categoryModel: CategoryModel())
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
                    Button(action: {
                        self.showModal = true
                    },
                           label: {
                        ReservationCell()
                            .sheet(isPresented: self.$showModal) {
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
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                            .buttonStyle(.plain)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 40)
                    )
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

