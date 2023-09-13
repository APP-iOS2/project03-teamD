//
//  HomeShowPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct HomeListRow: View {
    
    @State var place: Place
    
    var body: some View {
        NavigationLink {
            GongGanDetailView(placeId: place.id)
        } label: {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: "\(place.placeFirstImage)"), content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                minWidth: 100,
                                maxWidth: 100,
                                minHeight: 70,
                                maxHeight: 70
                            )
                    }) {
                        ProgressView()
                            .frame(
                                minWidth: 100,
                                maxWidth: 100,
                                minHeight: 70,
                                maxHeight: 70
                            )
                    }
                    .cornerRadius(4)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                    
                    VStack(alignment: .leading) {
                        Text("\(place.placeName)")
                            .foregroundColor(.black)
                            .font(.body1Bold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        Text("\(place.address.address)")
                            
                            .foregroundColor(.black)
                            .font(.captionRegular)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                    }// VSTACK
                    Spacer()
                }// HSTACK
                .foregroundColor(.myBackground)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.myLightGray)
            }// VSTACK
        }
    }
}

struct HomeShowPlaceListCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRow(place: HomeStore().places[0])
    }
}
