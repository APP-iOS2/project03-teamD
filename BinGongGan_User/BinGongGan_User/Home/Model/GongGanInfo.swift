//
//  GongGanInfo.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI

struct GongGan: Identifiable {
    var id: String = UUID().uuidString
    var placeName: String // 이름
    var categoryName: String // 공간유형
    var placePhone: String // 연락처
    var placeLocation: String // 주소
    var detailGongGan: [DetailGongGan] // 상세 방 정보들
    var placeImageUrl: [String] // 이미지
    var placeInfo: [String] //
    var placeGuide: [PlaceGuide]
    
    var isFavorite: Bool = false
    
    
    static let sampleGongGan = GongGan(placeName: "[서울역] 갬성 파티룸",
                                       categoryName: "파티룸",
                                       placePhone: "01039393939",
                                       placeLocation: "서울 송파구 송파대로 28길 13 (가락동, 거북이빌딩)",
                                       detailGongGan: [
//                                        DetailGongGan(title: "201호 선셋 오렌지",
//                                                      price: 16000,
//                                                      detailImageUrl: [
//                                                        "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_971/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/kuafyq7td56gof1rxpih/[%EB%B6%80%EC%82%B0%EC%84%9C%EB%A9%B4]%EC%8F%98%ED%94%8C%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%8A%A4%ED%86%A4%ED%8C%8C%ED%8B%B0%EB%A3%B8(%EC%95%BC%EC%99%B8%ED%85%8C%EB%9D%BC%EC%8A%A4%EB%B0%94%EB%B2%A0%ED%81%90).webp",
//                                                        "https://a.cdn-hotels.com/gdcs/production183/d989/3af773fa-b822-4da0-85de-a4ebfa559f32.jpg",
//                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl78G1gSU5SWWFWadyjHfIEhz_yPmVqjIGmA&usqp=CAU"
//                                                      ],
//                                                      info: "주방+요리재료+식사테이블+대형테이블+ 쇼파+65인치TV+넷플릭스,유투브,웨이브, 티빙, 디즈니플러스,쿠팡플레이 무료시청+글램핑분위기+서울타워뷰+보드게임+이벤트+예쁜조명+커플만남+단체모임 등 다양하게 이용할 수 있는 휴식공간이자 멀티파티룸입니다.\n",
//                                                      categoryName: "파티룸 공유주방",
//                                                      MinimumReservationTimeInfo: "최소 4시간 부터",
//                                                      capacity: "최소 1명 ~ 최대 13명"
//                                                     ),
//                                        DetailGongGan(title: "202호 불타는 애플",
//                                                      price: 16000,
//                                                      detailImageUrl: [
//                                                        "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_971/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/kuafyq7td56gof1rxpih/[%EB%B6%80%EC%82%B0%EC%84%9C%EB%A9%B4]%EC%8F%98%ED%94%8C%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%8A%A4%ED%86%A4%ED%8C%8C%ED%8B%B0%EB%A3%B8(%EC%95%BC%EC%99%B8%ED%85%8C%EB%9D%BC%EC%8A%A4%EB%B0%94%EB%B2%A0%ED%81%90).webp",
//                                                        "https://a.cdn-hotels.com/gdcs/production183/d989/3af773fa-b822-4da0-85de-a4ebfa559f32.jpg",
//                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl78G1gSU5SWWFWadyjHfIEhz_yPmVqjIGmA&usqp=CAU"
//                                                      ],
//                                                      info: "주방+요리재료+식사테이블+대형테이블+ 쇼파+65인치TV+넷플릭스,유투브,웨이브, 티빙, 디즈니플러스,쿠팡플레이 무료시청+글램핑분위기+서울타워뷰+보드게임+이벤트+예쁜조명+커플만남+단체모임 등 다양하게 이용할 수 있는 휴식공간이자 멀티파티룸입니다.\n",
//                                                      categoryName: "파티룸 공유주방",
//                                                      MinimumReservationTimeInfo: "최소 4시간 부터",
//                                                      capacity: "최소 1명 ~ 최대 13명"
//                                                     ),
//                                        DetailGongGan(title: "203호 뜨거운 감자",
//                                                      price: 16000,
//                                                      detailImageUrl: [
//                                                        "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_971/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/kuafyq7td56gof1rxpih/[%EB%B6%80%EC%82%B0%EC%84%9C%EB%A9%B4]%EC%8F%98%ED%94%8C%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%8A%A4%ED%86%A4%ED%8C%8C%ED%8B%B0%EB%A3%B8(%EC%95%BC%EC%99%B8%ED%85%8C%EB%9D%BC%EC%8A%A4%EB%B0%94%EB%B2%A0%ED%81%90).webp",
//                                                        "https://a.cdn-hotels.com/gdcs/production183/d989/3af773fa-b822-4da0-85de-a4ebfa559f32.jpg",
//                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl78G1gSU5SWWFWadyjHfIEhz_yPmVqjIGmA&usqp=CAU"
//                                                      ],
//                                                      info: "주방+요리재료+식사테이블+대형테이블+ 쇼파+65인치TV+넷플릭스,유투브,웨이브, 티빙, 디즈니플러스,쿠팡플레이 무료시청+글램핑분위기+서울타워뷰+보드게임+이벤트+예쁜조명+커플만남+단체모임 등 다양하게 이용할 수 있는 휴식공간이자 멀티파티룸입니다.\n",
//                                                      categoryName: "파티룸 공유주방",
//                                                      MinimumReservationTimeInfo: "최소 4시간 부터",
//                                                      capacity: "최소 1명 ~ 최대 13명"
//                                                     ),
//                                        DetailGongGan(title: "204호 시계는 와치",
//                                                      price: 16000,
//                                                      detailImageUrl: [
//                                                        "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_971/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/kuafyq7td56gof1rxpih/[%EB%B6%80%EC%82%B0%EC%84%9C%EB%A9%B4]%EC%8F%98%ED%94%8C%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%8A%A4%ED%86%A4%ED%8C%8C%ED%8B%B0%EB%A3%B8(%EC%95%BC%EC%99%B8%ED%85%8C%EB%9D%BC%EC%8A%A4%EB%B0%94%EB%B2%A0%ED%81%90).webp",
//                                                        "https://a.cdn-hotels.com/gdcs/production183/d989/3af773fa-b822-4da0-85de-a4ebfa559f32.jpg",
//                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl78G1gSU5SWWFWadyjHfIEhz_yPmVqjIGmA&usqp=CAU"
//                                                      ],
//                                                      info: "주방+요리재료+식사테이블+대형테이블+ 쇼파+65인치TV+넷플릭스,유투브,웨이브, 티빙, 디즈니플러스,쿠팡플레이 무료시청+글램핑분위기+서울타워뷰+보드게임+이벤트+예쁜조명+커플만남+단체모임 등 다양하게 이용할 수 있는 휴식공간이자 멀티파티룸입니다.\n",
//                                                      categoryName: "파티룸 공유주방",
//                                                      MinimumReservationTimeInfo: "최소 4시간 부터",
//                                                      capacity: "최소 1명 ~ 최대 13명"
//                                                     )
                                       ],
                                       placeImageUrl: [
                                        "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_971/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/kuafyq7td56gof1rxpih/[%EB%B6%80%EC%82%B0%EC%84%9C%EB%A9%B4]%EC%8F%98%ED%94%8C%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%8A%A4%ED%86%A4%ED%8C%8C%ED%8B%B0%EB%A3%B8(%EC%95%BC%EC%99%B8%ED%85%8C%EB%9D%BC%EC%8A%A4%EB%B0%94%EB%B2%A0%ED%81%90).webp",
                                        "https://a.cdn-hotels.com/gdcs/production183/d989/3af773fa-b822-4da0-85de-a4ebfa559f32.jpg"
                                        
                                       ],
                                       placeInfo: [
                                        "송파공유오피스",
                                        "가락시장역 3, 8호선 더블 초역세권 도보 1분거리",
                                        "다양한 업종 사업자등록가능 (근린생활시설 가능)",
                                        "비상주 서비스",
                                        "다양한 크기의 회의실 구비 (4인~10인) *1인실 ~ 4인실 구비"
                                       ], placeGuide: [
                                        PlaceGuide(labelTitle: "와이파이"),
                                        PlaceGuide(labelTitle: "주차장"),
                                        PlaceGuide(labelTitle: "반려동물"),
                                        PlaceGuide(labelTitle: "냉난방시설"),
                                        PlaceGuide(labelTitle: "화재경보기"),
                                        PlaceGuide(labelTitle: "소화기"),
                                        PlaceGuide(labelTitle: "엘리베이터"),
                                        PlaceGuide(labelTitle: "흡연실"),
                                       ]
    )
}

struct DetailGongGan: Identifiable {
    var id: String = UUID().uuidString
    var isSelected: Bool = false
    var title: String
    var price: Int
    var detailImageUrl: [String]
    var info: String // 세부공간 정보
    var categoryName: String // 공간유형
    var MinimumReservationTimeInfo: String // 최소예약시간정보
    var capacity: String // 수용인원 (최소1명~ 최대 12명)
    
    static let sample = DetailGongGan(title: "204호 06년생 민근",
                                      price: 16000,
                                      detailImageUrl: [
                                        "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_971/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/kuafyq7td56gof1rxpih/[%EB%B6%80%EC%82%B0%EC%84%9C%EB%A9%B4]%EC%8F%98%ED%94%8C%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%8A%A4%ED%86%A4%ED%8C%8C%ED%8B%B0%EB%A3%B8(%EC%95%BC%EC%99%B8%ED%85%8C%EB%9D%BC%EC%8A%A4%EB%B0%94%EB%B2%A0%ED%81%90).webp",
                                        "https://a.cdn-hotels.com/gdcs/production183/d989/3af773fa-b822-4da0-85de-a4ebfa559f32.jpg",
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl78G1gSU5SWWFWadyjHfIEhz_yPmVqjIGmA&usqp=CAU"
                                      ],
                                      info: "주방+요리재료+식사테이블+대형테이블+ 쇼파+65인치TV+넷플릭스,유투브,웨이브, 티빙, 디즈니플러스,쿠팡플레이 무료시청+글램핑분위기+서울타워뷰+보드게임+이벤트+예쁜조명+커플만남+단체모임 등 다양하게 이용할 수 있는 휴식공간이자 멀티파티룸입니다.\n",
                                      categoryName: "파티룸 공유주방",
                                      MinimumReservationTimeInfo: "최소 4시간 부터",
                                      capacity: "최소 1명 ~ 최대 13명"
    )
    
}

struct PlaceGuide: Identifiable {
    var id: String = UUID().uuidString
    var labelTitle: String
    var systemImage: String {
        switch labelTitle {
        case "와이파이":
            return "wifi"
        case "주차장":
            return "parkingsign"
        case "반려동물":
            return "pawprint.fill"
        case "냉난방시설":
            return "air.conditioner.horizontal.fill"
        case "화재경보기":
            return "flame"
        case "소화기":
            return "person"
        case "엘리베이터":
            return "door.sliding.left.hand.closed"
        case "흡연실":
            return "smoke.fill"
            
        default:
            return "exclamationmark.circle.fill"
        }
    }
}
