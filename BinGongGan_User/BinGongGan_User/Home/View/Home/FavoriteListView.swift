//
//  FavoriteListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/07.
//

import SwiftUI


struct FavoriteListView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    @State var isLoading: Bool = true
    var body: some View {
        TabView {
            ForEach(homeStore.hotPlace) { place in
                NavigationLink {
                    GongGanDetailView(placeId: place.id)
                } label: {
                    ZStack {
                        AsyncImage(url: URL(string: "\(place.placeImageString)") ) { image in
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
                                    Text("\(place.address.address)")
                                        .font(.body1Regular)
                                }
                                .foregroundColor(.white)
                                .padding()
                            }
                        }
                        .cornerRadius(8, corners: .bottomLeft)
                        .cornerRadius(8, corners: .bottomRight)
                    }// ZSTACK
                    .onAppear {
                        Task {
                            await homeStore.fetchPlaces()
                            self.isLoading = false
                        }
                    }
                    .redacted(reason: isLoading ? .placeholder :
                                [])
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

