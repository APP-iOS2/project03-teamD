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
                        Text("\(reservation.checkInDateString) ~ \(reservation.checkOutDateString) (\(reservation.hour)시간) , \(reservation.personnel)명")
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
                        Text("\(reservation.bankName ?? "") \(reservation.seller?.accountNumber ?? "") (\(reservation.seller?.name ?? ""))")
                            .font(.captionRegular)
                    }
                }
            }
            
            Section("공간 정보") {
                if let placeInfomationList = reservation.place?.placeInfomationList, !placeInfomationList.isEmpty {
                    VStack {
                        HStack(alignment: .center, spacing: 5) {
                            ForEach(placeInfomationList.prefix(4), id: \.self) { info in
                                infoView(for: info)
                            }
                        }.foregroundColor(.myDarkGray)
                        
                        if placeInfomationList.count > 4 {
                            HStack(alignment: .center, spacing: 5) {
                                ForEach(placeInfomationList.dropFirst(4), id: \.self) { info in
                                    infoView(for: info)
                                }
                            }.foregroundColor(.myDarkGray)
                        }
                    }
                }
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

@ViewBuilder
private func infoView(for info: String) -> some View {
    var systemImage: String {
        switch info {
        case "와이파이":
            return "wifi"
        case "주차장":
            return "parkingsign"
        case "반려동물":
            return "pawprint.fill"
        case "냉난방시설":
            return "air.conditioner.horizontal.fill"
        case "화재경보기":
            return "flame"
        case "소화기":
            return "fireplace"
        case "엘리베이터":
            return "door.sliding.left.hand.closed"
        case "흡연실":
            return "smoke.fill"
        default:
            return "exclamationmark.circle.fill"
        }
    }
    
    VStack(spacing: 5) {
        Image(systemName: systemImage)
        Text(info).font(.captionRegular)
    }
    .padding(10)
}

struct ReservationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailView(reservation: MyReservationStore().reservation)
    }
}
