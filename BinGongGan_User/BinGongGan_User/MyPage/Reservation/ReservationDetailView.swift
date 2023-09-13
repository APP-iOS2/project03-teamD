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
    private var reservationStatus: String {
        get {
            switch reservation.reservationState {
            case 0 :
                return "입금확인중"
            case 1 :
                return "예약취소"
            case 2 :
                return "리뷰작성"
            case 3 :
                return ""
            default :
                return ""
            }
        }
    }
    var body: some View {
            Form {
                Section("기본 정보") {
                    VStack(alignment: .leading) {
                        Text("예약 번호 : \(reservation.id)")
                            .font(.captionRegular)
                            .foregroundColor(.myDarkGray)
                        
                        Divider()
                        
                        
                        HStack {
                            Text(reservation.place?.placeName ?? "")
                                .font(.head1Bold)
                        }
                        
                        
                        
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
                            Text("\(reservation.checkInDateString) ~ \(reservation.checkOutDateString) | \(reservation.hour)시간  (\(reservation.personnel)명)")
                                .font(.captionRegular)
                                .foregroundColor(.myBrown)
                            
                        }
                        
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                        
                        HStack {
                            Image(systemName: "mappin")
                                .foregroundColor(.red)
                            Text("\(reservation.place?.address.address ?? "")")
                                .font(.captionRegular)
                            
                        }
                    }
                }
                
                Section("호스트 정보") {
                    VStack(alignment: .leading) {
                        Text("\(reservation.seller?.name ?? "")")
                            .font(.head1Bold)
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                        HStack {
                            Image(systemName: "phone.fill")
                            Text("\(reservation.seller?.phoneNumber ?? "")")
                                .font(.captionRegular)
                        }
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                        HStack {
                            Image(systemName: "creditcard.fill")
                            Text("국민 \(reservation.seller?.accountNumber ?? "") (\(reservation.seller?.name ?? ""))")
                                .font(.captionRegular)
                        }
                    }
                }
                
                Section("공간 정보") {
                    HStack(spacing: 5) {
                        ForEach(reservation.place?.placeInfomationList ?? [] , id: \.self) { info in
                            Text("\(info)")
                            
                        }
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
