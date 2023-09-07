//
//  FavoriteListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/07.
//

import SwiftUI

enum FavoriteListConstant {
    static let imageWidth =  CGFloat(80)
    static let imageHeight = CGFloat(80)
    static let rectangleWidth =     CGFloat(50)
    static let rectangleHeight =    CGFloat(160)
    static let tabViewWidth =       CGFloat(10)
    static let tabViewHeight =      CGFloat(160)
}

struct FavoriteListView: View {
    @ObservedObject var homeStore: HomeStore = HomeStore()
    let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            Text("이런 공간은 어떠세요?")
                .font(.head1Bold)
            TabView{
                ForEach(homeStore.places) { place in
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(
                                width: screenWidth -  FavoriteListConstant.rectangleWidth,
                                height: FavoriteListConstant.rectangleHeight)
                            .foregroundColor(.myPrimary)
                        
                        VStack {
                            HStack(spacing: 10) {
                                Spacer()
                                AsyncImage(url: place.imageURL ) { image in
                                    image
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(
                                            minWidth: FavoriteListConstant.imageWidth,
                                            maxWidth: FavoriteListConstant.imageHeight,
                                            minHeight: FavoriteListConstant.imageWidth,
                                            maxHeight: FavoriteListConstant.imageHeight
                                            ,alignment: .center
                                        )
                                } placeholder: {
                                    ProgressView()
                                        .frame(
                                            minWidth: FavoriteListConstant.imageWidth,
                                            maxWidth: FavoriteListConstant.imageHeight,
                                            minHeight: FavoriteListConstant.imageWidth,
                                            maxHeight: FavoriteListConstant.imageHeight
                                        )
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("\(place.placeName)")
                                        .font(.head1Bold)
                                        .foregroundColor(.myWhite)
                                    Text("\(place.placeLocation)")
                                        .font(.body1Regular)
                                        .foregroundColor(.myWhite)
                                    Text("\(place.placePrice)")
                                        .font(.body1Regular)
                                        .foregroundColor(.myWhite)
                                    
                                }.padding(.leading, 20)
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                NavigationLink {
                                    GongGanDetailView()
                                } label: {
                                    HStack {
                                        Text("더볼래?")
                                            .font(.body1Bold)
                                            .foregroundColor(.myBlack)
                                            .padding(.all , 5)
                                    }
                                    .background(Color.myWhite)
                                    .cornerRadius(12)
                                }
                                
                            }
                            .padding(.trailing, 90)
                        }
                    }//: ZSTACK
                    
                }
            }// TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(height: FavoriteListConstant.tabViewHeight)
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FavoriteListView()
        }
    }
}
