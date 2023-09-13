//
//  PublicPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct PlaceListRow: View {
    
    @State var place: Place
    @State private var backGroundWitdh: CGFloat = HomeNameSpace.screenWidth * 0.9
    @State private var backGroundHeight: CGFloat = HomeNameSpace.screenHeight * 0.75
    var body: some View {

        NavigationLink {
            GongGanDetailView(placeId: place.id)
        } label: {
            VStack(alignment: .leading) {
                
                AsyncImage(url: URL(string: "\(place.placeImageString)") ) { image in
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
                            .foregroundColor(.black)
                            
                    }
                    Text("\(place.address.address)")
                        .font(.body1Regular)
                        .foregroundColor(.black)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(place.placeInfomationString, id: \.self) { placeInformation in
                                    
                                    
                                        Text(placeInformation)
                                            .font(.captionBold)
                                        .foregroundColor(.myBrown)
                                    
                                }
                            }
                        }.frame(height: backGroundHeight * 0.1)
                    
                    
                }
                .frame(height: backGroundHeight * 0.32)
                .padding([.leading, .trailing], backGroundWitdh * 0.04)
               
            }// VSTACK
            .padding([.leading, .trailing], backGroundWitdh * 0.10)
           
            .background(
                RoundedRectangle(cornerRadius: 0)
                    .frame(
                        width: backGroundWitdh, height: backGroundHeight
                    )
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 1)
            )
        }
    }
}

struct PublicPlaceListCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        PlaceListRow(place: HomeStore().places[0])
    }
}
