//
//  MySpaceCell.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MySpaceCell: View {
    var room: Room
    @StateObject var placeStore: PlaceStore = PlaceStore()
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(room.name)
                        .font(.head1Bold)
                    Spacer()
                }
                .padding(.bottom, 10)
                
                HStack {
                    if let adress = placeStore.place?.address.address {
                        Text(adress)
                    }
                    Spacer()
                }
                
                HStack {
                    Text("\(room.price)원 / 시간당")
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("총 예약 수 200 리뷰 99 찜 10")
                }
                .padding(.top, 10)
            }
            .task {
                placeStore.fetchPlace()
            }
            .padding([.top, .trailing, .leading], 20)
            
            Spacer()
            
            CarouselCell(room: room)
                .frame(height: 210)
        }
       
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct MySpaceCell_Previews: PreviewProvider {
    static var previews: some View {
        MySpaceCell(room: Room(placeId: "", name: "101호", price: "1200", note: "ㅁㄴㅁㄴㅇㅁㄴ", imageNames: [""]))
            .environmentObject(PlaceStore())
    }
}
