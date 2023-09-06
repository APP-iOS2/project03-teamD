//
//  ReservationHeaderView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationHeaderView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            AsyncImage(
                url: reservationStore.sampleSpace.imageUrl,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screenWidth, height: 130)
                        .blur(radius: 3)
                        .clipped()
                },
                placeholder: {
                    ProgressView()
                })
            
            Rectangle()
                .frame(width: screenWidth,height: 130)
                .background(.black)
                .opacity(0.2)
            
            HStack {
                VStack(alignment:.listRowSeparatorLeading) {
                    Text(reservationStore.sampleSpace.spaceName)
                        .font(.title2)
                        .bold()
                        .padding(5)
                    Text("세부공간: ")
                        .font(.subheadline) + Text("\(reservationStore.sampleSpace.roomName)")
                        .bold()
                }
                .foregroundColor(.white)
            
                Spacer()
            }
            .padding()
            
        }
    }
}

struct ReservationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationHeaderView()
            .environmentObject(ReservationStore())
    }
}
