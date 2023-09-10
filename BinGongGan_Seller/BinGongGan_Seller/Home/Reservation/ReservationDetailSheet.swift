//
//  ReservationDetailSheet.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReservationDetailSheet: View {
    static let uiViewWidth = UIScreen.main.bounds.width
    @State var isSelectedRefusalButton: Bool = false
    @State var isSelectedApprovalButton: Bool = false
    
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
            Text("반드시 사용자 입금 확인 후 예약확정 버튼을 누르세요 ")
                .foregroundColor(.red)
                .bold()
            Spacer()
            
            HStack(spacing: 0){
                Button{
                    isSelectedApprovalButton.toggle()
                }
            label: {
                HStack {
                    Spacer()
                    Text("예약확정")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.myWhite)
                    Spacer()
                }
            }
            .buttonStyle(.plain)
            .frame(width: ReservationDetailSheet.uiViewWidth / 2, height: 50)
            .background(Color.myPrimary)
            .alert(isPresented: $isSelectedApprovalButton) {
                Alert(title: Text("예약 승인"), message: Text("해당 예약 요청을 승인하시겠습니까?"), primaryButton: .destructive(Text("취소"), action: {
                }), secondaryButton: .cancel(Text("승인")))
            }
                
                Spacer(minLength: 1)
                
                Button{
                    isSelectedRefusalButton.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Text("예약거절")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.myWhite)
                        Spacer()
                    }
                }
                .buttonStyle(.plain)
                .frame(width: ReservationDetailSheet.uiViewWidth / 2, height: 50)
                .background(Color.myPrimary)
                .alert(isPresented: $isSelectedRefusalButton) {
                    Alert(title: Text("예약 거절"), message: Text("해당 예약 요청을 거절하시겠습니까?"), primaryButton: .destructive(Text("취소"), action: {
                    }), secondaryButton: .cancel(Text("거절")))
                }
            }
        }
        .background(Color.myBackground)
    }
}

struct ReservationDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailSheet()
    }
}
