//
//  ReservationListModalView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReservationListModalView: View {
    static let uiViewWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack{
                Text("예약 내역 확인")
                    .font(.title2)
                    .bold()
                    .padding([.top, .leading], 20)
                    .foregroundColor(Color.myDarkGray)
                Spacer()
            }
            ReservationCell()
            Spacer()
            Text("반드시 사용자 입금 확인 후 예약확정 버튼을 누르세요 ")
                .foregroundColor(.red)
                .bold()
            Spacer()
            
            HStack(spacing: 0){
                Button(action: {},
                       label: {
                    HStack {
                        Spacer()
                        Text("예약확정")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.myWhite)
                        Spacer()
                    }
                })
                .buttonStyle(.plain)
                .frame(width: ReservationListModalView.uiViewWidth / 2, height: 50)
                .background(Color.myPrimary)
                Spacer(minLength: 1)
                Button(action: {},
                       label: {
                    HStack {
                        Spacer()
                        Text("예약거절")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.myWhite)
                        Spacer()
                    }
                })
                .buttonStyle(.plain)
                .frame(width: ReservationListModalView.uiViewWidth / 2, height: 50)
                .background(Color.myPrimary)
            }
        }
        .background(Color.myBackground)
    }
}

struct ReservationListModalView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationListModalView()
    }
}
