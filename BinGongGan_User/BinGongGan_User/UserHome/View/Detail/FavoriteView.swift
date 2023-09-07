//
//  FavoriteView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/07.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var gongGan: GongGanStore = GongGanStore()
    private let screenWidth = UIScreen.main.bounds.width
    private let screenheight = UIScreen.main.bounds.height
    var body: some View {
        NavigationStack {
            List {
                ForEach(gongGan.tempFavorit) { place in
                    NavigationLink {
                        GongGanDetailView()
                    } label: {
                        HStack {
                            VStack( alignment: .leading, spacing: 5) {
                                Text(place.title)
                                    .font(.body1Bold)
                                Text(place.category)
                                    .font(.captionRegular)
                                Spacer().frame(height: screenheight * 0.001)
                                Text(place.location)
                                    .font(.captionRegular)
                                
                            }
                            Spacer()

                        }
                        .frame(width: screenWidth * 0.8)
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.myPrimary)
                                .shadow(color: .gray, radius: 5, x: 3, y: 3)
                            
                        )
                    }
                    
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("나의 찜")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
