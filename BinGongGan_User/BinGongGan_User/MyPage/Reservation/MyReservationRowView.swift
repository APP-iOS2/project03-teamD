//
//  MyReservationRowView.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct MyReservationRowView: View {

    @State private var isShowingAddReview: Bool = false
    @State private var isShowingReservationCancelView: Bool = false
    @State private var isShowingReservationDetatilView: Bool = false
    
    var reservation: BinGongGanCore.Reservation
    
    var body: some View {
        VStack {
            HStack {
                Text("\(reservation.checkInDateString)")
                    .font(.body1Bold)
                Spacer()
                Button {
                    isShowingReservationDetatilView = true
                } label: {
                    Text("상세보기 >")
                        .font(.captionBold)
                        .foregroundColor(.myBrown)
                }
            }
            
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(reservation.roomID)")
                        .font(.body1Bold)
                        .foregroundColor(.myBrown)
                    
                    Text("예약 번호 : \(reservation.id)")
                        .font(.captionRegular)
                        .foregroundColor(.myBrown)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.01)
                    
                    Text("\(reservation.checkInDateString) | \(reservation.hour) (\(reservation.personnel)명)")
                        .font(.captionRegular)
                        .foregroundColor(.myBrown)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.01)
                    
                    Text("\(reservation.roomID)")
                        .font(.captionRegular)
                        .foregroundColor(.myBrown)
                }
                
                Spacer()
                
                Button {
                    if reservation.reservateStringCase == .all {
                        isShowingAddReview = true
                    } else {
                        isShowingReservationCancelView = true
                    }
                } label: {
                    Text(reservation.reservateStringCase == .all ? "리뷰작성" : "예약취소")
                        .font(.captionRegular)
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(reservation.reservateStringCase == .all ? .myMint : .myBrown)
                )
            }
            .fullScreenCover(isPresented: $isShowingAddReview) {
                NavigationStack {
                    AddReviewView()
                }
            }
            .navigationDestination(isPresented: $isShowingReservationCancelView) {
                ReservationCancelView()
            }
            .navigationDestination(isPresented: $isShowingReservationDetatilView) {
                ReservationDetailView(reservation: reservation)
            }
        }
        .padding()

    }
    
}

struct MyReservationRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationRowView(reservation: MyReservationStore().reservation)
        
    }
}
