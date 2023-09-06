//
//  GongGanInfo.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import Foundation
import SwiftUI

struct GongGanInfo: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var subTitle: String
    var simpleLocation: String
    var detailGongGan: [DetailGongGan]
}

struct DetailGongGan: Identifiable {
    var id: String = UUID().uuidString
    var isSelected: Bool = false
    var title: String
    var price: Int
    var pricePerTime: String
}

final class GongGanStore: ObservableObject {
    @Published var gongGanStore: GongGanInfo = 
        GongGanInfo(title: "[서울역] 갬성 파티룸",
                    subTitle: "공유주방/ 파티룸/ 블루투스 스피커",
                    simpleLocation: "서울역 15번 출구 도보 5분",
                    detailGongGan: [
                        DetailGongGan(title: "201호 선셋 오렌지",
                                      price: 16000,
                                      pricePerTime: "시간"),
                        DetailGongGan(title: "202호 불타는 애플",
                                      price: 16000,
                                      pricePerTime: "시간"),
                        DetailGongGan(title: "203호 02년생 윤호",
                                      price: 16000,
                                      pricePerTime: "시간"),
                        DetailGongGan(title: "204호 06년생 민근",
                                      price: 16000,
                                      pricePerTime: "시간"),
                    ]
                   )
    var tempImage: [String] = [
        "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_971/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/kuafyq7td56gof1rxpih/[%EB%B6%80%EC%82%B0%EC%84%9C%EB%A9%B4]%EC%8F%98%ED%94%8C%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%8A%A4%ED%86%A4%ED%8C%8C%ED%8B%B0%EB%A3%B8(%EC%95%BC%EC%99%B8%ED%85%8C%EB%9D%BC%EC%8A%A4%EB%B0%94%EB%B2%A0%ED%81%90).webp",
                               "https://a.cdn-hotels.com/gdcs/production183/d989/3af773fa-b822-4da0-85de-a4ebfa559f32.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl78G1gSU5SWWFWadyjHfIEhz_yPmVqjIGmA&usqp=CAU"
        
    ]
    
    func customSection(_ text: String) -> some View {
        VStack(alignment: .leading) {
            Text(text)
                .bold()
            Rectangle()
                .fill(Color.myLightGray)
                .frame(height: 2)
//                .opacity(0.6)
                
        }
    }
}

