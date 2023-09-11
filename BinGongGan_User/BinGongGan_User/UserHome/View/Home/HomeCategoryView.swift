//
//  HomePlaceListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct HomeCategoryView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    
    var body: some View {
        
        HStack(spacing: 10) {
            Grid(horizontalSpacing: 20) {
                GridRow {
                    ForEach(homeStore.categories) { category in
                        NavigationLink {
                                PlaceListView(category: category.category.rawValue)
                                    .environmentObject(homeStore)
                        } label: {
                            VStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.myWhite)
                                    Image(systemName: "\(category.categoryImageString)")
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.mySecondary)
                                        .font(.system(size: 27))
                                }
                                Text(category.category.rawValue)
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
                .environmentObject(HomeStore())
        }
    }
}
