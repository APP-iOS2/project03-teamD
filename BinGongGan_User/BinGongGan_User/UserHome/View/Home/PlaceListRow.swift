//
//  PublicPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
enum PlaceRowConstant {
    static let cellHeight = CGFloat(200)
}

struct PlaceListRow: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    @State var place: Place
    
    var body: some View {
        VStack{
            AsyncImage(url: place.imageURL, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenWidth - 20 , height: PlaceRowConstant.cellHeight)
                    .foregroundColor(.gray)
            }) {
                ProgressView()
            }
            NavigationLink {
                GongGanDetailView()
            } label: {
                Rectangle()
                    .frame(width: screenWidth - 20 , height: PlaceRowConstant.cellHeight - 100)
                    .foregroundColor(.white)
                    .border(.black)
                    .overlay(alignment: .topLeading){
                        Text("\(place.placeName)")
                            .font(.body1Bold)
                            .padding()
                        
                    }
                    .overlay(alignment: .leading){
                        Text("\(place.placeLocation)")
                            .padding()
                            .font(.captionRegular)

                    }
                    .overlay(alignment: .bottomLeading){
                        Text("\(place.placePrice)")
                            .font(.body1Regular)
                            .padding()
                    }
                    .overlay(alignment: .bottomTrailing){
                        Text("최대 인원 00명")
                            .padding()
                            .font(.captionRegular)
                    }
                    .overlay(alignment: .topTrailing) {
                        Button {
                            place.isFavorite.toggle()
                        } label: {
                            Image(systemName: place.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
            }
            .foregroundColor(.black)

            
                
        }// VSTACK
        
    }
}

struct PublicPlaceListCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListRow(place: HomeStore().places[0])
    }
}
