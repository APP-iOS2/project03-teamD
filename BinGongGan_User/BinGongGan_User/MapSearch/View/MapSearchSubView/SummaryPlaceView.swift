//
//  SummaryPlaceView.swift
//  SampleMapKit
//
//  Created by 윤지호 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct SummaryPlaceView: View {
    var place: Place
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.white)
            .frame(width: 320, height: 180)
            .shadow(radius: 15, y: 4)
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(place.placeName)
                                .font(.headline)
                            Text(place.note[0])
                                .font(.footnote)
                        }
                        Spacer()
                        
                        AsyncImage(url: URL(string: place.placeImageStringList[0]) ) { image in
                            image
                                .resizable()
                                .frame(width: 60, height: 60)
                                .background(.brown)
                                .cornerRadius(8)
                        } placeholder: {
                            ProgressView()
                        }
     
                    }
                    .padding()
                    
                    Text(place.note[0])
                        .padding([.leading, .trailing, .bottom])
                    Spacer()
                }
            }
    }
}

//struct SummaryPlaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryPlaceView()
//    }
//}
