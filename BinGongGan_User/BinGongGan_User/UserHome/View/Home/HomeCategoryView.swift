//
//  HomePlaceListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

enum HomeCategoryConstant {
    static let padding = CGFloat(20)
    static let cellWidth =  CGFloat(50)
    static let cellHeight = CGFloat(50)
    static let cellCorner = CGFloat(15)
    static let fontSize = CGFloat(12)
}

struct HomeCategoryView: View {
    
    private let layout = [60, 60, 60]
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    @ObservedObject var dummyStore: HomeStore = HomeStore()
    
    var body: some View {
        
        HStack(spacing: 10) {
            Grid(horizontalSpacing: 20) {
                GridRow {
                    ForEach(dummyStore.categories) { place in
                        NavigationLink {
                            PlaceListView(category: place.category.rawValue)
                        } label: {
                            VStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.myWhite)
                                        
                                    Image(systemName: "\(place.categoryImageString)")
                                        
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.myPrimary)
                                        .font(.system(size: 27))
                                }
                                Text(place.category.rawValue)
                                    .font(.captionBold)
                                    .foregroundColor(.myPrimary)
                                    .lineLimit(1)
                            }
                            
                        }// NAVIGATIONLINK
                    }
                }
            }
            
            
        }// HSTACK
        
        
    }
}

struct HomePlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeCategoryView()
        }
    }
}
