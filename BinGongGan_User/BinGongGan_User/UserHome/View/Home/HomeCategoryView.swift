//
//  HomePlaceListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct HomeCategoryView: View {
    
    @ObservedObject var homeStore: HomeStore = HomeStore()
    
    var body: some View {
        
        HStack(spacing: 10) {
            Grid(horizontalSpacing: 20) {
                GridRow {
                    ForEach(homeStore.categories) { place in
                        NavigationLink {
                            PlaceListView(category: place.category.rawValue)
                        } label: {
                            VStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.myWhite)
                                    Image(systemName: "\(place.categoryImageString)")
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.mySecondary)
                                        .font(.system(size: 27))
                                }
                                Text(place.category.rawValue)
                                    .font(.captionBold)
                                    .foregroundColor(.myPrimary)
                                    .lineLimit(1)
                            }// VSTACK
                        }// NAVIGATIONLINK
                    }
                }// GRIDROW
            }// GRID
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
