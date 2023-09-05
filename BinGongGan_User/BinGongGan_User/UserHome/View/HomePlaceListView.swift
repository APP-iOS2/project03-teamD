//
//  HomePlaceListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum HomePlaceListViewConstant {
        static let cellsPadding = CGFloat(5)
    //    static let cellHeight = CGFloat(100)
    //    static let cellCorner = CGFloat(15)
}

enum PlaceCellConstant {
    static let cellWidth = CGFloat(70)
    static let cellHeight = CGFloat(70)
    static let cellCorner = CGFloat(15)
    static let fontSize = CGFloat(12)
}

struct HomePlaceListView: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    @ObservedObject var dummyStore: DummyStore = DummyStore()
    
    var body: some View {
        
        ScrollViewReader { reader in
            ScrollView(.horizontal , showsIndicators: false ){
                HStack {
                    ForEach(dummyStore.PlaceDummys) { place in
                        NavigationLink {
                            PublicOfficeView()
                        } label: {
                            VStack {
                                PlaceCell(cellImage: place.placeImage)
                                    .cornerRadius(PlaceCellConstant.cellCorner)
                                Text(place.placeName)
                                    .font(.system(size: PlaceCellConstant.fontSize))
                            }
                        }// NAVIGATIONLINK
                    }.padding(HomePlaceListViewConstant.cellsPadding)
                }
                .padding(.leading, 20)
                .padding(.bottom, 20)
            }// SCROLLVIEW
            .frame(width: screenWidth, height: 50)
        }// SCROLLVIEWREADER
    }
}

struct HomePlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        HomePlaceListView()
    }
}
