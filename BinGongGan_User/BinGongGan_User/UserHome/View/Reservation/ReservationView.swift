//
//  ReservationView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    @State var checkRefundPolicy: Bool = true
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack {
            // 상단 바
            ReservationHeaderView()
                .padding(.top, 1)
            
            ScrollView {
                // 달력
                ReservationCalendarView()
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    
                    // 시간, 인원, 입금자명, 연락처, 요청사항
                    ReservationUserInfoView()
                    
                    // 이용 시 주의 사항, 환불 규정
                    ReservationSellerInfoView()
                    
                    Button {
                        if let reservation = reservationStore.reservation {
                            if reservation.checkPolicy {
                                //PaymentView()
                                
                                print("true 일경우 \(checkRefundPolicy)")
                            }
                        }
                    } label: {
                        Text("무통장으로 입금")
                            .frame(width: screenWidth - 40, height: 50)
                            .foregroundColor(checkRefundPolicy ? Color.white : Color.myMediumGray)
                            .background(checkRefundPolicy ? Color.myPrimary : Color.myLightGray )
                        
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                    .padding([.top, .bottom], 10)
                }
                .padding([.leading, .trailing], 20)
            }
        }
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
        }
        /*
         .alert(isPresented: $openRefundPolicySheet) {
         Alert(title: Text("무통장 입금"),
         message: Text("계좌번호 : 1010101010110"),
         dismissButton: .default(Text("확인"),action: {
         presentationMode.wrappedValue.dismiss()
         }))
         }
         */
        .background(Color.myBackground)
        .navigationTitle("예약화면")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.myBackground, for: .navigationBar)
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
