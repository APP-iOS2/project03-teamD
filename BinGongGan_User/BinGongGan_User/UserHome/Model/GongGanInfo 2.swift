//
//  GongGanInfo.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import Foundation

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

class GongGanStore: ObservableObject {
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
    
}
