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
                .padding(.horizontal, 20)
            
            Text("반드시 사용자 입금 확인 후 예약확정 버튼을 누르세요")
                .foregroundColor(.red)
                .bold()
            
            Spacer()
            
            HStack {
                Button{
                    isSelectedApprovalButton.toggle()
                    
                } label: {
                    HStack {
                        Spacer()
                        Text("예약확정")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .buttonStyle(.plain)
                .frame(height: 50)
                .background(Color.myBrown)
                .alert(isPresented: $isSelectedApprovalButton) {
                    Alert(title: Text("예약 승인"), message: Text("해당 예약 요청을 승인하시겠습니까?"), primaryButton: .destructive(Text("취소"), action: {
                    }), secondaryButton: .cancel(Text("승인")))
                }
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 1, height: 50)
                    .padding(.vertical, 5)
                
                Button {
                    isSelectedRefusalButton.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Text("예약거절")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .buttonStyle(.plain)
                .frame(height: 50)
                .background(Color.myBrown)
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
