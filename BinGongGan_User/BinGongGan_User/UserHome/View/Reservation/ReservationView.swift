//
//  ReservationView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var reservationStore: ReservationStore = ReservationStore()
    @State var isReservationFinished: Bool = false
    
    @State var isReservationEmpty: Bool = false
    
    @Binding var tabBarVisivility: Visibility
    
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
                    
                    if isReservationEmpty {
                        Text("빈칸이 존재합니다.")
                            .foregroundColor(.red)
                            .font(.captionRegular)
                    }
                    
                    Button {
                        // 데이터 저장
                        if reservationStore.reservation.reservationName.isEmpty || reservationStore.reservation.reservationPhoneNumber.isEmpty {
                            isReservationEmpty = true
                        } else {
                            
                            isReservationEmpty = false
                            isReservationFinished.toggle()
                        }
                    } label: {
                        Text("무통장으로 입금")
                            .frame(width: screenWidth * 0.9, height: 50)
                            .foregroundColor(reservationStore.isPolicyChecked ? Color.white : Color.myMediumGray)
                            .background(reservationStore.isPolicyChecked ? Color.myPrimary : Color.myLightGray )
                            .cornerRadius(8)
                    }
                    .disabled(!reservationStore.isPolicyChecked)
                    .buttonStyle(.plain)
                    .padding([.top, .bottom], 10)
                    .navigationDestination(isPresented: $isReservationFinished) {
                        PaymentView()
                            .environmentObject(reservationStore)
                        //.toolbar(tabBarVisible, for: .tabBar)
                            .navigationBarBackButtonHidden()
                    }
                }
                .padding([.leading], 20)
            }
        }
        .background(Color.myBackground)
        .navigationTitle("예약화면")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.myBackground, for: .navigationBar)
        .customBackbutton()
        .onAppear {
            tabBarVisivility = .hidden
        }
        .onDisappear {
            tabBarVisivility = .visible
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReservationView(tabBarVisivility: .constant(.hidden))
                .environmentObject(ReservationStore())
        }
    }
}
