//
//  MyPlaceManagementView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyPlaceManagementView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            VStack {
                Section {
                    SellerInformationCell()
                        .padding([.bottom, .leading, .trailing])
                } header: {
                    HStack {
                        Text("내 정보")
                            .padding([.top, .leading], 20)
                            .font(.head1Bold)
                        Spacer()
                        NavigationLink {
                            
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color.mySecondary)
                                .font(.title3)
                                .padding([.top, .trailing], 20)
                        }
                    }
                }
                
                Section {
                    
                } header: {
                    HStack {
                        Text("내 공간")
                            .padding([.top, .leading], 20)
                            .font(.head1Bold)
                        Spacer()
                    }
                }
            }
        }
        .background(Color.myBackground)
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
    }
}

struct MyPlaceManagementView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPlaceManagementView()
        }
    }
}
