//
//  ReservationHeaderView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationHeaderView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    @Binding var placeName: String
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            if let room = reservationStore.reservationRoom {
                AsyncImage(
                    url: URL(string: room.imageNames[0]),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screenWidth, height: 110)
                            .blur(radius: 3)
                            .clipped()
                    },
                    placeholder: {
                        ProgressView()
                    })
                
                Rectangle()
                    .frame(width: screenWidth, height: 110)
                    .background(.black)
                    .opacity(0.2)
                
                HStack {
                    VStack(alignment:.listRowSeparatorLeading) {
                        Text(placeName)
                            .font(.title2)
                            .bold()
                            .padding(5)
                        Text("세부공간: ")
                            .font(.subheadline) + Text("\(room.name)")
                            .bold()
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding()
            }
            
        }
    }
}

struct ReservationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationHeaderView(placeName: .constant(""))
            .environmentObject(ReservationStore())
    }
}
