//
//  SubGongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct SubGongGanDetailView: View {
    @EnvironmentObject var gongGan: GongGanStore
    private let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        NavigationStack {
                    
                
                VStack(alignment: .leading, spacing: 10) {
//                    AsyncImage(url: URL(string: "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_971/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/kuafyq7td56gof1rxpih/[%EB%B6%80%EC%82%B0%EC%84%9C%EB%A9%B4]%EC%8F%98%ED%94%8C%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%8A%A4%ED%86%A4%ED%8C%8C%ED%8B%B0%EB%A3%B8(%EC%95%BC%EC%99%B8%ED%85%8C%EB%9D%BC%EC%8A%A4%EB%B0%94%EB%B2%A0%ED%81%90).webp")) { image in
//                        image
//                            .resizable()
//                            .scaledToFill()
//                            .frame(height: 250)
//                    } placeholder: {
//                        ProgressView()
//                    }
                    DetailTabImageView()
                    VStack(alignment: .leading) {
                        gongGan.customSection("공간 소개")
                        Text("주방+요리재료+식사테이블+대형테이블+ 쇼파+65인치TV+넷플릭스,유투브,웨이브, 티빙, 디즈니플러스,쿠팡플레이 무료시청+글램핑분위기+서울타워뷰+보드게임+이벤트+예쁜조명+커플만남+단체모임 등 다양하게 이용할 수 있는 휴식공간이자 멀티파티룸입니다.\n")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.subheadline)
                            .foregroundColor(.myDarkGray)
                        VStack(alignment: .leading, spacing: 10) {
                            gongGan.customSection("공간 정보")
                            Group {
                                HStack {
                                    Text(" ◦ 공간유형  :")
                                    Text("파티룸 공유주방")
                                }
                                HStack {
                                    Text(" ◦ 예약시간  :")
                                    Text("최소 4시간 부터")
                                }
                                HStack {
                                    Text(" ◦ 수용인원  :")
                                    Text("최소 1명 ~ 최대 13명")
                                }
                                Divider()
                            }
                            .font(.subheadline)
                            .foregroundColor(.myDarkGray)
                        }
                        .foregroundColor(.black)
                    }
                    .font(.body1Regular)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 1, trailing: 0))
                }
        }
        .padding()
    }
}

struct SubGongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubGongGanDetailView()
            .environmentObject(GongGanStore())
    }
}
