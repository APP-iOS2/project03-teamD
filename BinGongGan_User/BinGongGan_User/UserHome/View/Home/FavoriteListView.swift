//
//  FavoriteListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/07.
//

import SwiftUI

struct FavoriteListView: View {
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    @ObservedObject var homeStore: HomeStore = HomeStore()
    
    var body: some View {
        
        TabView {
            ForEach(homeStore.places) { place in
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
                            .foregroundColor(.myBlack)
                        .opacity(0.5)
                        .overlay(alignment: .topLeading) {
                            VStack(alignment: .leading) {
                                
                                Text("\(place.placeName)")
                                    .font(.head1Bold)
                                    .padding(.bottom, 0.5)
                                Text("\(place.placeLocation)")
                                    .font(.body1Regular)
                            }
                            .foregroundColor(.myWhite)
                            .padding()
                        }
                    }
                    .cornerRadius(8, corners: .bottomLeft)
                    .cornerRadius(8, corners: .bottomRight)
                    
                }
                    
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .frame( height: screenHeight * 0.5)
        
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FavoriteListView()
        }
    }
}

