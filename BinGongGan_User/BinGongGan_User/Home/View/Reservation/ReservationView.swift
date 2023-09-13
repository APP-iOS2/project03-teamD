//
//  ReservationView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationView: View {
    
    //@AppStorage ("email") var email: String!
    @EnvironmentObject var reservationStore: ReservationStore
    @Environment(\.dismiss) private var dismiss
    
    //@Binding var roomID: String // 바인딩으로 받지 않고 detail 뷰에서 셋다 넣어버리는 건?
    @Binding var placeName: String // 공간 이름
    @State var roomID: String = "00B41F70-0576-4815-936F-C49F86E7C418"
    
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
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    
                    // 시간, 인원, 입금자명, 연락처, 요청사항
                    ReservationUserInfoView()
                    
                    // 이용 시 주의 사항, 환불 규정
                    ReservationSellerInfoView()
                    
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
        .onAppear {
            if reservationStore.reservation.userEmail.isEmpty {
                //reservationStore.reservation.userEmail = email
                reservationStore.fetchReservationRoom(roomID: roomID)
            }
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReservationView(placeName: .constant(""))
                .environmentObject(ReservationStore())
        }
    }
}
