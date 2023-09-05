//
//  ReservationView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    var body: some View {
        // 상단 바
        ReservationHeaderView()
        
        // 달력
        
        // 시간, 인원, 입금자명, 연락처, 요청사항
        
        // 이용 시 주의 사항, 환불규정
        .toolbar {
            //ToolbarItem
        }
        .navigationTitle("예약화면")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReservationView()
                .environmentObject(ReservationStore())
        }
    }
}
