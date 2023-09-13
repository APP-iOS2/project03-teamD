//
//  FavoriteView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/07.
//

import SwiftUI
import BinGongGanCore

struct FavoriteView: View {
    
    @EnvironmentObject var gongGan: MyFavoriteStore
    @State var isHeartButtonShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
                if gongGan.myFavoriteGongGan.isEmpty {
                    Text("찜 목록이 없어요")
                } else {
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
            }
            .refreshable {
                Task {
                    await gongGan.fetchMyFavorite()
                }
            }
            .onAppear {
                Task {
                    await gongGan.fetchMyFavorite()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isHeartButtonShowing.toggle()
                    } label: {
                        Text("Edit")
                            .foregroundColor(.myBrown)
                    }
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
