//
//  ReservationConfirmedSheet.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct ReservationConfirmedSheet: View {
    private let uiViewWidth = UIScreen.main.bounds.width
    @State var isSelectedRefusalButton: Bool = false
    @State var isSelectedApprovalButton: Bool = false
    let data : SellerReservation
    var body: some View {
        VStack {
            HStack{
                Text("확정 내역 확인")
                    .font(.head1Bold)
                    .padding([.top, .leading], 20)
                    .foregroundColor(Color.myDarkGray)
                Spacer()
            }
            
            ReservationCell(data: data, isHiddenRightButton: false)
            .padding(.bottom, 12)
            .padding(.horizontal, 20)
//            Text("예약 취소시에 위약금이 발생할 수 있습니다.")
//                .foregroundColor(.red)
//                .bold()
            Spacer()
            
            HStack {
                Button{
                    isSelectedApprovalButton.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Text("예약 확정")
                            .font(.body1Bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .buttonStyle(.plain)
                .frame(height: 50)
                .background(Color.myBrown)
            }
        }
        .background(Color.myBackground)
//        .alert(isPresented: $isSelectedApprovalButton) {
//            Alert(title: Text("예약 취소"),
//                  message: Text("해당 확정 예약을 취소하시겠습니까?"),
//                  primaryButton: .destructive(Text("취소"),
//                                              action: {}),
//                  secondaryButton: .cancel(Text("돌아가기")))
//        }
    }
}

struct ReservationConfirmedSheet_Previews: PreviewProvider {
    static var previews: some View {
        ReservationConfirmedSheet(data: SellerReservation(id: "", userEmail: "", roomID: "", reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", placeID: "", hour: 0, personnel: 0, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservationState: 0))
    }
}
