//
//  MyReservationRowView.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/06.
//

import SwiftUI

struct MyReservationRowView: View {
    
    var reservate: ReservationModel
    @State private var isShowingAddReview: Bool = false
    @State private var isShowingReservationCancelView: Bool = false
    @State private var isShowingReservationDetatilView: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("\(reservate.reservationDate)")
                    .font(.body1Bold)
                Spacer()
                Button {
                    isShowingReservationDetatilView = true
                } label: {
                    Text("상세보기 >")
                        .font(.captionBold)
                }
            }
            
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(reservate.placeName)")
                        .font(.body1Bold)
                        .foregroundColor(.myPrimary)
                    
                    Text("예약 번호 : \(reservate.reservationNumber)")
                        .font(.captionRegular)
                        .foregroundColor(.myPrimary)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.01)
                    
                    Text("\(reservate.reservationDate) | \(reservate.reservationTime) (\(reservate.reservationPersonal)명)")
                        .font(.captionRegular)
                        .foregroundColor(.myPrimary)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.01)
                    
                    Text("\(reservate.placeAddress)")
                        .font(.captionRegular)
                        .foregroundColor(.myPrimary)
                }
                
                Spacer()
                
                Button {
                    if reservate.isReservation {
                        isShowingAddReview = true
                    } else {
                        isShowingReservationCancelView = true
                    }
                } label: {
                    Text(reservate.isReservation ? "리뷰작성" : "예약취소")
                        .font(.captionRegular)
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(reservate.isReservation ? .mySecondary : .myPrimary)
                )
            }
            
            
            .fullScreenCover(isPresented: $isShowingAddReview) {
                NavigationStack {
                    AddReviewView(reservate: reservate)
                }
            }
            .navigationDestination(isPresented: $isShowingReservationCancelView) {
                ReservationCancelView()
            }
            .navigationDestination(isPresented: $isShowingReservationDetatilView) {
                ReservationDetailView(reservate: reservate)
            }
        }.padding()
            
    }
}

struct MyReservationRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationRowView(reservate:  ReservationModel(placeName: "희권이네 설빙", reservationNumber: "A103120235", reservationDate: "9/7 (목) 17:00 ~ 21:00", reservationTime: "" , reservationPersonal: 5, placeAddress: "서울특별시 희권구", isReservation: false))
    }
}
