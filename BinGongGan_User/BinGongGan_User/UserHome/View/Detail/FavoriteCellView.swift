//
//  FavoriteCellView.swift
//  BinGongGan_User
//
//  Created by 최하늘 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct FavoriteCellView: View {
    @State var listRow: TempFavorit
    @State var tempHeartToggle: Bool = false
    
    var body: some View {
        NavigationLink {
            GongGanDetailView()
        } label: {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: listRow), content: { image in
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
                        
                        Text("\(gongGan.gongGanStore.title)")
                            .padding(.top , 17)
                            .foregroundColor(.myBlack)
                            .font(.body1Bold)
                        Text("\(gongGan.gongGanStore.simpleLocation)")
                            .padding(.bottom , 3)
                            .foregroundColor(.myBlack)
                            .font(.captionRegular)
                        Text("12,000원 / 시간당")
                            .padding(.bottom , 17)
                            .foregroundColor(.myBlack)
                            .font(.captionRegular)
                    }// VSTACK
                    Spacer()
                    Button {
//                        place.isFavorite.toggle()
                    } label: {
                        Image(systemName: tempHeartToggle ? "heart.fill" : "heart")
                            .foregroundColor(.mySecondary)
                    }.padding(.trailing, 20)
                    
                }// HSTACK
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.myLightGray)
            }// VSTACK
            
        }
    }
}

struct FavoriteCellView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCellView()
            .environmentObject(GongGanStore())
    }
}
