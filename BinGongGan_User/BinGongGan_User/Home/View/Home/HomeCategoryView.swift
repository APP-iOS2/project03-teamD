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
                                PlaceListView()
                                    .environmentObject(homeStore)
                            // 질문 !
                        } label: {
                            VStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.white)
                                        
                                    Image(systemName: "\(category.categoryImageString)")
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.myMint)
                                        .font(.system(size: 27))
                                        
                                }
                            
                                Text(category.category)
                                    .font(.captionBold)
                                    .foregroundColor(.myBrown)
                                    .lineLimit(1)
                            }// VSTACK
                        }// NAVIGATIONLINK
                        .simultaneousGesture(TapGesture().onEnded({
                            homeStore.selectedCategory = category.category
                        }))
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
