//
//  ReservationDetailView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReservationDetailView: View {
    
    var reservation: BinGongGanCore.Reservation
    
    var body: some View {
        Form {
            Section("기본 정보") {
                VStack(alignment: .leading) {
                    Text(reservation.roomID)
                        .font(.head1Bold)
                    Text("예약 번호 : \(reservation.id)")
                        .font(.captionRegular)
                        .foregroundColor(.myDarkGray)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                    
                    HStack {
                        Image(systemName: "wonsign.circle")
                            .foregroundColor(.yellow)
                        Text("199,000원")
                            .font(.captionRegular)
                        
                    }
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                    
                    HStack {
                        Image(systemName: "calendar.badge.clock")  .foregroundColor(.blue)
                        Text("\(reservation.checkInDateString) (\(reservation.personnel)명)")
                            .font(.captionRegular)
                        
                    }
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                    
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundColor(.red)
                        Text("\(reservation.reservationRequest)")
                            .font(.captionRegular)
                        
                    }
                }
                
            }
            
            Section("호스트 정보") {
                VStack(alignment: .leading) {
                    Text("방유빈")
                        .font(.head1Bold)
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                    HStack {
                        Image(systemName: "phone.fill")
                        Text("010-1234-5678")
                            .font(.captionRegular)
                    }
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                    HStack {
                        Image(systemName: "creditcard.fill")
                        Text("국민 46390204174780 (방유빈)")
                            .font(.captionRegular)
                    }
                }
            }
            
            Section("공간 정보") {
                HStack(spacing: 5) {
                    VStack(spacing: 5) {
                        Image(systemName: "wifi")
                        Text("wifi").font(.captionRegular)
                    }
                    .padding(5)
                    VStack(spacing: 5) {
                        Image(systemName: "car.fill")
                        Text("주차").font(.captionRegular)
                    }
                    .padding(5)
                    
                    VStack(spacing: 5) {
                        Image(systemName: "desktopcomputer")
                        Text("PC").font(.captionRegular)
                    }
                    .padding(5)
                    .font(.captionRegular)
                }
                .foregroundColor(.myDarkGray)
            }
            
            Section("환불 규정") {
                VStack(alignment: .leading , spacing: 5 ) {
                    Text("24시간 전 : 취소 수수료 없음")
                    Text("12시간 전 : 취소 수수료 10%")
                    Text("6시간 전 : 취소 수수료 30%")
                    Text("2시간 전 : 취소 불가 (호스트 문의)")
                        .foregroundColor(.black).bold()
                }.font(.captionRegular)
                    .foregroundColor(.myDarkGray)
            }
            
            
        }
        .navigationTitle("예약 정보")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
    }
}

struct ReservationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailView(reservation: MyReservationStore().reservation)
    }
}
