//
//  ReservationListModalView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI

struct ReservationListModalView: View {
    var body: some View {
        VStack {
            HStack{
                Text("예약 내역 확인")
                    .font(.title)
                    .bold()
                    .padding([.top, .leading], 20)
                Spacer()
            }
            ReservationCell()
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
                            .foregroundColor(.white)
                        Spacer()
                    }
                }).buttonStyle(.plain)
                    .frame(width: UIScreen.main.bounds.width / 2, height: 50)
                    .background(Color.green)
                Spacer(minLength: 1)
                Button(action: {},
                       label: {
                    HStack {
                        Spacer()
                        Text("예약거절")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                }).buttonStyle(.plain)
                    .frame(width: UIScreen.main.bounds.width / 2, height: 50)
                    .background(Color.green)
            }
        }
    }
}

struct ReservationListModalView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationListModalView()
    }
}
