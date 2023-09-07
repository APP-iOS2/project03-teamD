//
//  PublicPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PlaceListRow: View {
    
    @State var place: Place
    
    var body: some View {

        NavigationLink {
            GongGanDetailView()
        } label: {
            VStack(alignment: .leading) {
                AsyncImage(url: place.imageURL ) { image in
                    image
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: HomeNameSpace.screenWidth * 0.89,
                               height: (HomeNameSpace.screenHeight * 0.8) * 0.6)
                } placeholder: {
                    ProgressView()
                        .frame(width: HomeNameSpace.screenWidth * 0.89,
                               height: (HomeNameSpace.screenHeight * 0.8) * 0.6)
                }
                .cornerRadius(3)
                VStack(alignment: .leading){
                    HStack {
                        Text("\(place.placeName)")
                            .font(.head1Bold)
                            .foregroundColor(.myBlack)
                    }
                    Text("\(place.placeLocation)")
                        .font(.body1Regular)
                        .foregroundColor(.myBlack)
                    Text("\(place.placePrice)")
                        .font(.body1Regular)
                        .foregroundColor(.myBlack)
                    Text("최대 인원 00명")
                        .font(.body1Regular)
                        .foregroundColor(.myBlack)
                }
                .frame(height: (HomeNameSpace.screenHeight * 0.8) * 0.4)
                .padding([.leading, .trailing], 20)
            }
            .background(
                RoundedRectangle(cornerRadius: 0)
                    .frame(
                        width: HomeNameSpace.screenWidth * 0.89, height: HomeNameSpace.screenHeight * 0.8
                    )
                    .foregroundColor(.myWhite)
                    .cornerRadius(3)
                    .shadow(radius: 1, x: 3, y: 1)
            )
            .overlay(alignment: .topTrailing) {
                Button {
                    place.isFavorite.toggle()
                } label: {
                    Image(systemName: place.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .font(.system(size: 30))
                        .padding(20)
                }
            }
        }
    }
}

struct PublicPlaceListCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListRow(place: HomeStore().places[0])
    }
}
