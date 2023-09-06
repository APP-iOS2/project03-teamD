//
//  HomeShowPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

enum HomeListRowConstant {
    //    static let showPlaceListWidth = CGFloat(50)
    static let showPlaceListHeight = CGFloat(100)
}
enum ImageFrame {
    static let width = CGFloat(100)
    static let height = CGFloat(70)
    
}

struct HomeListRow: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    @State var place: Place
    
    var body: some View {
        NavigationLink {
            GongGanDetailView()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.myPrimary)
                    .frame(width: screenWidth - HomeViewConstant.searchButtonHeight ,
                           height: HomeListRowConstant.showPlaceListHeight)
                HStack {
                    AsyncImage(url: place.imageURL, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                minWidth:ImageFrame.width,
                                maxWidth: ImageFrame.width,
                                minHeight: ImageFrame.height,
                                maxHeight: ImageFrame.height
                            )
                    }) {
                        ProgressView()
                            .frame(
                                minWidth:ImageFrame.width,
                                maxWidth: ImageFrame.width,
                                minHeight: ImageFrame.height,
                                maxHeight: ImageFrame.height
                            )
                    }
                    .cornerRadius(15)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                    
                    VStack(alignment: .leading) {
                        
                        Text("\(place.placeName)")
                            .padding(.top , 17)
                            .foregroundColor(.white)
                            .font(.body1Bold)
                        Text("\(place.placeLocation)")
                            .padding(.bottom , 3)
                            .foregroundColor(.white)
                            .font(.captionRegular)
                        Text("\(place.placePrice) / 시간당")
                            .padding(.bottom , 17)
                            .foregroundColor(.white)
                            .font(.captionRegular)
                    }// VSTACK
                    Spacer()
                    Button {
                        place.isFavorite.toggle()
                    } label: {
                        Image(systemName: place.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(place.isFavorite ? .red : .myBackground)
                    }.padding(.trailing, 20)
                    
                }// HSTACK
                .frame(width: screenWidth - HomeViewConstant.searchButtonHeight ,
                       height: HomeListRowConstant.showPlaceListHeight)
            }// ZSTACK
        }
    }
}

struct HomeShowPlaceListCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRow(place: HomeStore().places[3])
    }
}
