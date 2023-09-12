//
//  ReservationView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    @Environment(\.dismiss) private var dismiss
    
    @State var isReservationFinished: Bool = false
    @State var isReservationEmpty: Bool = false
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack {
            // 상단 바
            ReservationHeaderView()
                .padding(.top, 1)
            
            ScrollView {
                // 달력
                ReservationCalendarView()
                    .environmentObject(reservationStore)
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    
                    // 시간, 인원, 입금자명, 연락처, 요청사항
                    ReservationUserInfoView()
                        .environmentObject(reservationStore)
                    
                    // 이용 시 주의 사항, 환불 규정
                    ReservationSellerInfoView()
                        .environmentObject(reservationStore)
                    
                    Button {
                        // 데이터 저장
                        if reservationStore.reservation.reservationName.isEmpty || reservationStore.reservation.reservationPhoneNumber.isEmpty {
                            isReservationEmpty = true
                        } else {
                            isReservationEmpty = false
                            isReservationFinished.toggle()
                            reservationStore.addReservation()
                        }
                    } label: {
                        Text("무통장으로 입금")
                            .frame(width: screenWidth * 0.9, height: 50)
                            .foregroundColor(reservationStore.isPolicyChecked ? Color.white : Color.myMediumGray)
                            .background(reservationStore.isPolicyChecked ? Color.myBrown : Color.myLightGray )
                            .cornerRadius(8)
                    }
                    .disabled(!reservationStore.isPolicyChecked)
                    .buttonStyle(.plain)
                    .padding([.top, .bottom], 10)
                    .navigationDestination(isPresented: $isReservationFinished) {
                        PaymentView()
                            .environmentObject(reservationStore)
                            .navigationBarBackButtonHidden()
                    }
                }
                .padding([.leading], 20)
            }
        }
        .toast(isShowing: $isReservationEmpty, message: "빈 칸이 존재합니다")
        .background(Color.myBackground)
        .navigationTitle("예약화면")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.myBackground, for: .navigationBar)
        .customBackbutton()
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
