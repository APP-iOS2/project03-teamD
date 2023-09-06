//
//  PublicPlaceListCellView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
enum PublicPlaceRowConstant {
    static let cellHeight = CGFloat(200)
}

struct PublicPlaceListRow: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var place: PublicPlaceListDummy
    
    var body: some View {
        VStack{
            AsyncImage(url: place.imageURL, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenWidth , height: PublicPlaceRowConstant.cellHeight)
                    .foregroundColor(.gray)
                    .padding(.bottom , -10)
            }) {
                ProgressView()
            }
                
            
            Rectangle()
                .frame(width: screenWidth , height: PublicPlaceRowConstant.cellHeight - 100)
                .foregroundColor(.white)
                .border(.black)
                .overlay(alignment: .topLeading){
                    Text("\(place.placeName)")
                        .padding()
                }
                .overlay(alignment: .leading){
                    Text("\(place.placeLocation)")
                        .padding()
                        .font(.footnote)
                }
                .overlay(alignment: .bottomLeading){
                    Text("\(place.placePrice)")
                        .padding()
                }
                .overlay(alignment: .bottomTrailing){
                    Text("최대 인원 00명")
                        .padding()
                        .font(.footnote)
                }
                .overlay(alignment: .topTrailing) {
                    Button {
//                        dummyStore.homeShowPlaceListDummy[index].isFavorite.toggle()
                    } label: {
                        Image(systemName: "heart.fill" )
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                
        }// VSTACK
        .padding(20)
    }
}

struct PublicPlaceListCellView_Previews: PreviewProvider {
    static var previews: some View {
        PublicPlaceListRow(place: DummyStore().publicPlaceList[0])
    }
}
