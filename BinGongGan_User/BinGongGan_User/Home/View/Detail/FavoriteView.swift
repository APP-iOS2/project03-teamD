//
//  FavoriteView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/07.
//

import SwiftUI
import BinGongGanCore

struct FavoriteView: View {
    @StateObject var gongGan: MyFavoriteStore = MyFavoriteStore()
    @State var isHeartButtonShowing: Bool = false
    
    var body: some View {
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            ScrollView {
                ForEach(gongGan.myFavoriteGongGan) { gongGanItem in
                    VStack {
                        FavoriteCellView(isHeartButtonShowing: $isHeartButtonShowing, gongGanItem: gongGanItem)
                    }
                }
                .navigationTitle("나의 찜")
                .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
            .padding(.top, 10)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isHeartButtonShowing.toggle()
                } label: {
                    Text("Edit")
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FavoriteView()
                .environmentObject(MyFavoriteStore())
        }
    }
}
