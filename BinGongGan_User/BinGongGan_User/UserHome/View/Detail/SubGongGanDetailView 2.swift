//
//  SubGongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI

struct SubGongGanDetailView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                Image("detailSample1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                VStack(alignment: .leading) {
                    Text("주방+요리재료+식사테이블+대형테이블+ 쇼파+65인치TV+넷플릭스,유투브,웨이브, 티빙, 디즈니플러스,쿠팡플레이 무료시청+글램핑분위기+서울타워뷰+보드게임+이벤트+예쁜조명+커플만남+단체모임 등 다양하게 이용할 수 있는 휴식공간이자 멀티파티룸입니다.\n")
                        .fixedSize(horizontal: false, vertical: true)
                    VStack(alignment: .leading) {
                        HStack {
                            Label("공간유형", systemImage: "circlebadge.fill")
                            Text("파티룸 공유주방")
                        }
                        HStack {
                            Label("예약시간", systemImage: "circlebadge.fill")
                            Text("최소 4시간 부터")
                        }
                        HStack {
                            Label("수용인원", systemImage: "circlebadge.fill")
                            Text("최소 1명 ~ 최대 13명")
                        }
                    }
                    .foregroundColor(.black)
                }
            }
            .padding(.bottom, 1)
        }
        .padding()
    }
}

struct SubGongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubGongGanDetailView()
    }
}
