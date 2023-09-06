//
//  HomePlaceListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

enum HomeCategoryConstant {
    static let hstackPadding = CGFloat(5)
    static let cellWidth = CGFloat(75)
    static let cellHeight = CGFloat(75)
    static let cellCorner = CGFloat(15)
    static let fontSize = CGFloat(12)
}

struct HomeCategoryView: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    @ObservedObject var dummyStore: HomeStore = HomeStore()
    
    var body: some View {
        
        HStack {
            ForEach(dummyStore.categories) { place in
                NavigationLink {
                    PlaceListView(category: place.category.rawValue)
                } label: {
                    VStack {
                        AsyncImage(url: place.imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: HomeCategoryConstant.cellWidth , height: HomeCategoryConstant.cellHeight)
                                .background(Color.myPrimary)
                                .cornerRadius(15)
                        } placeholder: {
                            ProgressView()
                        }   
                        
                        Text(place.category.rawValue)
                            .font(.body1Bold)
                            .foregroundColor(.black)
                    }
                }// NAVIGATIONLINK
            }.padding(HomeCategoryConstant.hstackPadding)
            
        }.padding([.leading, .trailing], 5)
    }
}

struct HomePlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeCategoryView()
        }
    }
}
