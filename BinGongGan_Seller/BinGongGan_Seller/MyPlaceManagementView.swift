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
                    }
                }
                
                Section {
                    GeometryReader { geometry in
                        let size = geometry.size
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 5) {
                                ForEach(1...3, id: \.self) { i in
                                    GeometryReader { proxy in
                                        let cardSize = proxy.size
                                        
                                        if i != 3 {
                                            MySpaceCell()
                                                .frame(width: cardSize.width - 20)
                                        } else {
                                            NavigationLink(destination: PlaceAddView()) {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .fill(.white)
                                                        .frame(width: cardSize.width - 20)
                                                    
                                                    VStack {
                                                        Image(systemName: "plus.square.fill.on.square.fill").font(.title)
                                                            .padding(.bottom, 10)
                                                        Text("새 공간 추가하기")
                                                            .font(.title3)
                                                    }
                                                    .foregroundColor(.gray)
                                                }
                                            }
                                        }
                                    }
                                    .frame(width: size.width - 50, height: size.width - 10)
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                        }
                    }
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
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
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
        .customBackbutton()
    }
}

struct MyPlaceManagementView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPlaceManagementView()
        }
    }
}
