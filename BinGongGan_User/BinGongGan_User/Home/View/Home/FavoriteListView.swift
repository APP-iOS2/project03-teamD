//
//  FavoriteListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/07.
//

import SwiftUI


struct FavoriteListView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    
    var body: some View {
        TabView {
            ForEach(homeStore.hotPlace) { place in
                NavigationLink {
                    GongGanDetailView()
                } label: {
                    ZStack {
                        AsyncImage(url: place.imageURL ) { image in
                            image
                                .renderingMode(.original)
                                .resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .cornerRadius(8)
                        VStack {
                            Spacer()
                            Rectangle()
                                .frame( height: 92)
                                .foregroundColor(.black)
                            .opacity(0.5)
                            .overlay(alignment: .topLeading) {
                                VStack(alignment: .leading) {
                                    
                                    Text("\(place.placeName)")
                                        .font(.head1Bold)
                                        .padding(.bottom, 0.5)
                                    Text("\(place.placeLocation)")
                                        .font(.body1Regular)
                                }
                                .foregroundColor(.white)
                                .padding()
                            }
                        }
                        .cornerRadius(8, corners: .bottomLeft)
                        .cornerRadius(8, corners: .bottomRight)
                    }// ZSTACK
                }
            }.padding(.horizontal, 5)
        }// TABVIEW
        .tabViewStyle(PageTabViewStyle())
        .frame( height: HomeNameSpace.screenWidth * 0.5)
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FavoriteListView()
                .environmentObject(HomeStore())
        }
    }
}

