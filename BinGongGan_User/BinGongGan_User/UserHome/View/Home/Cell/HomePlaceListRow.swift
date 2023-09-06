//
//  HomeShowPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

enum PlaceListRowConstant {
    //    static let showPlaceListWidth = CGFloat(50)
    static let showPlaceListHeight = CGFloat(120)
}

struct HomePlaceListRow: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    @State var place: PublicPlaceListDummy
    
    var body: some View {
        NavigationLink {
            // 공간 디테일뷰로 가야함 (대진님이랑 말해야함)
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.myPrimary)
                    .frame(width: screenWidth - HomeViewConstant.searchButtonHeight ,
                           height: PlaceListRowConstant.showPlaceListHeight)
                    .opacity(0.8)
                HStack {
                    AsyncImage(url: place.imageURL, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100 , maxHeight: 120)
                            .padding(20)
                    }) {
                        ProgressView()
                    }
                        
                    VStack(alignment: .leading) {
                        
                        Text("\(place.placeName)")
                            .padding(.top , 17)
                            .foregroundColor(.black)
                            .font(.body1Bold)
                        Text("\(place.placeLocation)")
                            .padding(.bottom , 3)
                            .foregroundColor(.black)
                            .font(.captionRegular)
                        Text("\(place.placePrice) / 시간당")
                            .padding(.bottom , 17)
                            .foregroundColor(.black)
                            .font(.body1Bold)
                    }// VSTACK
                    Button {
                        place.isFavorite.toggle()
                    } label: {
                        Image(systemName: place.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .padding()
                    }
                }// HSTACK
            }// ZSTACK
            
        }
    }
}

struct HomeShowPlaceListCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomePlaceListRow(place: DummyStore().publicPlaceList[1])
    }
}
