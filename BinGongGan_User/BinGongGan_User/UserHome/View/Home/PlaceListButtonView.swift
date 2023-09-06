//
//  HomePlaceListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

enum PlaceListButtonConstant {
    static let hstackPadding = CGFloat(5)
    static let cellWidth = CGFloat(75)
    static let cellHeight = CGFloat(75)
    static let cellCorner = CGFloat(15)
    static let fontSize = CGFloat(12)
}

struct PlaceListButtonView: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    @ObservedObject var dummyStore: DummyStore = DummyStore()
    
    var body: some View {
        
        HStack {
            ForEach(dummyStore.homePlaceList) { place in
                NavigationLink {
                    PublicPlaceListView()
                } label: {
                    VStack {
                        AsyncImage(url: place.imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: PlaceListButtonConstant.cellWidth , height: PlaceListButtonConstant.cellHeight)
                                .background(Color.myPrimary)
                                .cornerRadius(15)
                        } placeholder: {
                            ProgressView()
                        }   
                        
                        Text(place.placeName)
                            .font(.body1Bold)
                            .foregroundColor(.black)
                    }
                }// NAVIGATIONLINK
            }.padding(PlaceListButtonConstant.hstackPadding)
            
        }.padding([.leading, .trailing], 5)
    }
}

struct HomePlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PlaceListButtonView()
        }
    }
}
