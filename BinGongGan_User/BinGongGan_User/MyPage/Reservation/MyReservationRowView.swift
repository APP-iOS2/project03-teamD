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
                return "이용완료"
            case 4 :
                return "취소완료"
            default :
                return ""
            }
        }
    }
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
                    
                    Text("\(reservation.place?.placeName ?? "")")
                        .font(.head1Bold)
                        .foregroundColor(.myBrown)
                    
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.01)
                    
                    Text("\(reservation.checkInDateString) ~ \(reservation.checkOutDateString) (\(reservation.hour)시간)")
                        .font(.captionRegular)
                        .foregroundColor(.myBrown)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.01)
                    
                    Text("\(reservation.personnel)명")
                        .font(.captionRegular)
                        .foregroundColor(.myBrown)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.01)
                    
                    Text("\(reservation.place?.address.address ?? "")")
                        .font(.captionRegular)
                        .foregroundColor(.myBrown)
                }
                Spacer()
                
                Button {
                    if reservation.reservateStringCase == .success {
                        if reservationStatus == "이용완료" {
                            
                        } else {
                            isShowingAddReview = true
                        }
                    } else {
                        if reservationStatus == "취소완료" {
                            
                        } else {
                            isShowingReservationCancelView = true
                        }
                    }
                } label: {
                    Text(reservationStatus)
                        .font(.captionRegular)
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(reservation.reservateStringCase == .success ? .myMint : .myBrown)
                )
            }
            .fullScreenCover(isPresented: $isShowingAddReview) {
                NavigationStack {
                    AddReviewView(reservation: reservation)
                }
            }
            .navigationDestination(isPresented: $isShowingReservationCancelView) {
                ReservationCancelView(reservation: reservation)
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
