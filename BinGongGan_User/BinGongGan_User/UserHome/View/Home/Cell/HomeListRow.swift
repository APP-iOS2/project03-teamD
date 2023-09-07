//
//  HomeShowPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

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
            VStack {
                HStack {
                    AsyncImage(url: place.imageURL, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
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
                    .cornerRadius(4)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                    
                    VStack(alignment: .leading) {
                        
                        Text("\(place.placeName)")
                            .padding(.top , 17)
                            .foregroundColor(.myBlack)
                            .font(.body1Bold)
                        Text("\(place.placeLocation)")
                            .padding(.bottom , 3)
                            .foregroundColor(.myBlack)
                            .font(.captionRegular)
                        Text("\(place.placePrice) / 시간당")
                            .padding(.bottom , 17)
                            .foregroundColor(.myBlack)
                            .font(.captionRegular)
                    }// VSTACK
                    Spacer()
                    Button {
                        place.isFavorite.toggle()
                    } label: {
                        Image(systemName: place.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(.myPrimary)
                    }.padding(.trailing, 20)
                    
                }// HSTACK
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.myLightGray)
            }// VSTACK
            
        }
    }
}

struct HomeShowPlaceListCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRow(place: HomeStore().places[3])
    }
}
