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
            VStack {
                HStack {
                    Text("판매자 정보")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 20)
                    Spacer()
                }
                SellerInformationCell()
                HStack {
                    Text("내 공간")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 20)
                    Spacer()
                    NavigationLink {
                        PlaceAddView()
                    } label: {
                        Text("내 공간 추가")
                            .padding(.trailing, 20)
                    }

                }
                TabView {
                    // TODO: TabView 작동 안돼서 수정 필요
                    ForEach(1...3, id: \.self) { _ in
                        MySpaceCell()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .scrollContentBackground(.hidden)
            .background(Color.myBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.myPrimary)
                    }
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
