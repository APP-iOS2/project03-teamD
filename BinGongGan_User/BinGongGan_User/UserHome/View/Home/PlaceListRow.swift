//
//  PublicPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PlaceListRow: View {
    
    @State var place: Place
    @State private var backGroundWitdh: CGFloat = HomeNameSpace.screenWidth * 0.9
    @State private var backGroundHeight: CGFloat = HomeNameSpace.screenHeight * 0.75
    var body: some View {

        NavigationLink {
            GongGanDetailView()
        } label: {
            VStack(alignment: .leading) {
                AsyncImage(url: place.imageURL ) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: backGroundWitdh,
                               height: backGroundHeight * 0.68)
                } placeholder: {
                    ProgressView()
                        .frame(width: backGroundWitdh,
                               height: backGroundHeight * 0.68)
                }
                .cornerRadius(15, corners: .topLeft)
                .cornerRadius(15, corners: .topRight)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(place.placeName)")
                            .font(.head1Bold)
                            .foregroundColor(.myBlack)
                    }
                    Text("\(place.placeLocation)")
                        .font(.body1Regular)
                        .foregroundColor(.myBlack)
                    
                    HStack(spacing: 109) {
                        Text("\(place.placePrice) / 시간 당")
                            .font(.body1Regular)
                            .foregroundColor(.myBlack)

                        Text("최대 인원 00명")
                            .font(.body1Regular)
                        .foregroundColor(.myBlack)
                    }.padding(.top, 4)
                    
                }
                .frame(height: backGroundHeight * 0.32)
                .padding([.leading, .trailing], 20)
               
            }// VSTACK
            .background(
                RoundedRectangle(cornerRadius: 0)
                    .frame(
                        width: backGroundWitdh, height: backGroundHeight
                    )
                    .foregroundColor(.myWhite)
                    .cornerRadius(15)
                    .shadow(radius: 1)
            )
            .overlay(alignment: .trailingFirstTextBaseline) {
                HeartButton(place: $place)
                    .padding(20)
            }
        }
        
    }
}

struct PublicPlaceListCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        PlaceListRow(place: HomeStore().places[0])
    }
}
