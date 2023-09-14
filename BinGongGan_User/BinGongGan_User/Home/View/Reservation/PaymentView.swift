//
//  PaymentView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/06.
//

import SwiftUI

struct PaymentView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var reservationStore: ReservationStore
    
    @Binding var placeName: String
    
    @State private var isAllPaymentInfoChecked: Bool = false
    @State private var isPaymentChecked: Bool = false
    
    @State var tabBarVisivility: Visibility = .visible
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            List {
                if let room = reservationStore.reservationRoom {
                    AsyncImage(
                        url: URL(string: room.imageNames[0]),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screenWidth, height: 180)
                                .clipped()
                        },
                        placeholder: {
                            ProgressView()
                        })
                    .listRowBackground(Color.clear)
                    
                    HStack {
                        Text("방식")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        Text(reservationStore.sellerAccount)
                            .font(.captionRegular)
                    }
                    .foregroundColor(.red)
                    .listRowBackground(Color.clear)
                    
                    HStack {
                        Text("총 금액")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        Text("\(reservationStore.getReservationPrice())원")
                            .font(.captionRegular)
                    }
                    .foregroundColor(.red)
                    .listRowBackground(Color.clear)
                    
                    HStack {
                        Text("예약 번호")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        Text(reservationStore.getReservation(type: .reservationID))
                            .font(.captionRegular)
                    }
                    .listRowBackground(Color.clear)
                    
                    HStack {
                        Text("신청일")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        Text(reservationStore.getReservation(type: .reservationDate))
                            .font(.captionRegular)
                    }
                    .listRowBackground(Color.clear)
                    
                    
                    HStack {
                        Text("예약 공간")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("공간 이름: \(placeName)")
                                .padding(.bottom, 0.2)
                            if let room = reservationStore.reservationRoom {
                                Text("방 이름: \(room.name)")
                            }
                        }
                        .font(.captionRegular)
                    }
                    .listRowBackground(Color.clear)
                    
                    HStack {
                        Text("예약 내용")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("체크인 날짜: \(reservationStore.getReservation(type: .checkInDate))")
                                .padding(.bottom, 0.2)
                            Text("체크아웃 날짜: \(reservationStore.getReservation(type: .checkOutDate))")
                                .padding(.bottom, 0.2)
                            Text("하루 이용 시간: \(reservationStore.getReservation(type: .hour))")
                        }
                        .font(.captionRegular)
                    }
                    .listRowBackground(Color.clear)
                    
                    HStack {
                        Text("예약 인원")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        Text(reservationStore.getReservation(type: .personnel))
                            .font(.captionRegular)
                    }
                    .listRowBackground(Color.clear)
                    
                    HStack {
                        Text("예약자 정보")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("이름: \(reservationStore.getReservation(type: .reservationName))")
                                .padding(.bottom, 0.2)
                            Text("전화번호: \(reservationStore.getReservation(type: .reservationPhoneNumber))")
                        }
                        .font(.captionRegular)
                    }
                    .listRowBackground(Color.clear)
                    
                    HStack {
                        Text("요청사항")
                            .font(.body1Regular)
                            .frame(width: 80)
                        
                        Divider()
                        
                        Text(reservationStore.getReservation(type: .reservationRequest))
                            .font(.captionRegular)
                    }
                    .listRowBackground(Color.clear)
                    
                }
            }
            .listStyle(.plain)
            
            Button {
                isAllPaymentInfoChecked.toggle()
            } label: {
                Text("확인")
                    .frame(width: screenWidth * 0.9, height: 50)
                    .foregroundColor(Color.myBackground)
                    .background(Color.myBrown )
                
                    .cornerRadius(8)
            }
            .buttonStyle(.plain)
            .padding([.top, .bottom], 10)
        }
        .modifier(
            TossAlertModifier(
                isPresented: $isAllPaymentInfoChecked,
                title: "결제 확인",
                content: "계좌번호로 2일 내에 입금 부탁드립니다",
                primaryButtonTitle: "확인",
                primaryAction: { isPaymentChecked.toggle() })
        )
        .navigationDestination(isPresented: $isPaymentChecked) {
            HomeView(tabBarVisivility: $tabBarVisivility)
                .navigationBarBackButtonHidden()
        }
        .background(Color.myBackground)
        .navigationTitle("결제 정보")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .onAppear {
            if let room = reservationStore.reservationRoom {
                reservationStore.fetchReservationAccount(sellerID: room.placeId)
            }
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PaymentView(placeName: .constant(""))
                .environmentObject(ReservationStore())
        }
    }
}
