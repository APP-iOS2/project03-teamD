//
//  ReservationDetailSheet.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReservationDetailSheet: View {
    
    @EnvironmentObject private var rervationStore : RervationStore
    @State var isSelectedRefusalButton: Bool = false
    @State var isSelectedApprovalButton: Bool = false
    
    static let uiViewWidth = UIScreen.main.bounds.width
   
    let data: SellerReservation
    var body: some View {
        VStack {
            HStack{
                Text("예약 내역 확인")
                    .font(.head1Bold)
                    .padding([.top, .leading], 20)
                    .foregroundColor(Color.myDarkGray)
                Spacer()
            }
            
            ReservationCell(data: data, isHiddenRightButton: false)
                .padding(.bottom, 12)
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
                            .font(.body1Bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .buttonStyle(.plain)
                .frame(height: 50)
                .background(Color.myBrown)
                .alert(isPresented: $isSelectedApprovalButton) {
                    Alert(title: Text("예약 승인"),
                          message: Text("해당 예약 요청을 승인하시겠습니까?"),
                          primaryButton: .destructive(Text("취소"),
                                                      action: {
                     
                    }),
                          secondaryButton: .cancel(Text("승인"),action: {
                        Task{  await rervationStore.updateRervation(id:data.id,isReserve:true )
                        }
                    }))
                }
                
                Spacer(minLength: 1)
                
                Button {
                    isSelectedRefusalButton.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Text("예약거절")
                            .font(.body1Bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .buttonStyle(.plain)
                .frame(height: 50)
                .background(Color.myBrown)
                .alert(isPresented: $isSelectedRefusalButton) {
                    Alert(title: Text("예약 거절"),
                          message: Text("해당 예약 요청을 거절하시겠습니까?"),
                          primaryButton: .destructive(Text("취소"),
                                                      action: {}),
                          secondaryButton: .cancel(Text("거절"),action: {
                        Task{  await rervationStore.updateRervation(id:data.id,isReserve:false )
                        }
                    }))
                }
            }
        }
        .background(Color.myBackground)
    }
}

struct ReservationDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailSheet(data: SellerReservation(id: "", userEmail: "", roomID: "", reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", placeID: "", hour: 0, personnel: 0, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservationState: 0))
    }
}
