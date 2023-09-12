//
//  FavoriteCellView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct FavoriteCellView: View {
    @Binding var isHeartButtonShowing: Bool
    var gongGanItem: GongGan
    
    var body: some View {
        NavigationLink {
            GongGanDetailView(gongGan: gongGanItem)
        } label: {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: gongGanItem.placeImageUrl[0]), content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                minWidth: 100,
                                maxWidth: 100,
                                minHeight: 70,
                                maxHeight: 70
                            )
                    }) {
                        ProgressView()
                            .frame(
                                minWidth: 100,
                                maxWidth: 100,
                                minHeight: 70,
                                maxHeight: 70
                            )
                    }
                    .cornerRadius(4)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                    
                    VStack(alignment: .leading) {
                        Text("\(gongGanItem.placeLocation)")
                            .padding(.bottom , 3)
                            .foregroundColor(.black)
                            .font(.captionRegular)
                        Text("12,000원 / 시간당")
                            .padding(.bottom , 17)
                            .foregroundColor(.black)
                            .font(.captionRegular)
                    }
                    Spacer()
                    Button {
                    } label: {
                        if isHeartButtonShowing {
                            Image(systemName: gongGanItem.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.myMint)
                        }
                    }
                    .padding(.trailing, 20)
                    .buttonStyle(.plain)
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.myLightGray)
            }
        }
    }
}

struct FavoriteRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FavoriteCellView(isHeartButtonShowing: .constant(false), gongGanItem: GongGan.sampleGongGan)
        }
    }
}
