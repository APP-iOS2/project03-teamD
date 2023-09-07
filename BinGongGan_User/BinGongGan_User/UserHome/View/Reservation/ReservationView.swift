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
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack {
            // 상단 바
            ReservationHeaderView()
                .environmentObject(reservationStore)
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
                    
                    NavigationLink {
                        PaymentView()
                            .environmentObject(reservationStore)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("무통장으로 입금")
                            .frame(width: screenWidth * 0.9, height: 50)
                            .foregroundColor(reservationStore.checkPolicy ? Color.white : Color.myMediumGray)
                            .background(reservationStore.checkPolicy ? Color.myPrimary : Color.myLightGray )
                        
                            .cornerRadius(8)
                    }
                    .disabled(!reservationStore.checkPolicy)
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
        }
    }
}
