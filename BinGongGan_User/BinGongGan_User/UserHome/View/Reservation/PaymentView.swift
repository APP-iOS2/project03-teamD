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
    
    @State private var isAllPaymentInfoChecked: Bool = false
    @State private var isPaymentChecked: Bool = false
    
    //@Binding var tabBarVisible: Visibility
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            List {
                AsyncImage(
                    url: reservationStore.sampleSpace.imageUrl,
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
                    
                    Text("무통장 입금 seller/ 통장번호")
                }
                    .foregroundColor(.red)
                    .listRowBackground(Color.clear)
                
                HStack {
                    Text("예약 번호")
                        .font(.body1Regular)
                        .frame(width: 80)
                    Divider()
                    
                    Text(reservationStore.getReservation(type: .reservationID))
                }
                    .listRowBackground(Color.clear)
                
                HStack {
                    Text("신청일")
                        .font(.body1Regular)
                        .frame(width: 80)
                    Divider()
                    
                    Text(reservationStore.getReservation(type: .reservationDate))
                }
                    .listRowBackground(Color.clear)
                
                HStack {
                    Text("예약 공간")
                        .font(.body1Regular)
                        .frame(width: 80)
                    Divider()
                    
                    Text("공간 이름:")
                    Text("방 이름:")
                }
                    .listRowBackground(Color.clear)
                
                HStack {
                    Text("예약 내용")
                        .font(.body1Regular)
                        .frame(width: 80)
                    Divider()
                    
                    Text("체크인 날짜: \(reservationStore.getReservation(type: .checkInDate))")
                    Text("체크아웃 날짜: \(reservationStore.getReservation(type: .checkOutDate))")
                    Text("하루 이용 시간: \(reservationStore.getReservation(type: .hour))")
                }
                    .listRowBackground(Color.clear)
                
                HStack {
                    Text("예약 인원")
                        .font(.body1Regular)
                        .frame(width: 80)
                    Divider()
                    
                    Text(reservationStore.getReservation(type: .personnel))
                }
                    .listRowBackground(Color.clear)
                
                HStack {
                    Text("예약자 정보")
                        .font(.body1Regular)
                        .frame(width: 80)
                    Divider()
                    
                    Text("이름: \(reservationStore.getReservation(type: .reservationName))")
                    Text("전화번호: \(reservationStore.getReservation(type: .reservationPhoneNumber))")
                }
                    .listRowBackground(Color.clear)
                
                HStack {
                    Text("요청사항")
                        .font(.body1Regular)
                        .frame(width: 80)
                    Divider()
                    
                    Text(reservationStore.getReservation(type: .reservationRequest))
                }
                    .listRowBackground(Color.clear)
                
            }
            //.padding([.leading, .trailing], 10)
            .listStyle(.plain)
            
            Button {
                isAllPaymentInfoChecked.toggle()
            } label: {
                Text("확인")
                    .frame(width: screenWidth * 0.9, height: 50)
                    .foregroundColor(Color.myBackground)
                    .background(Color.myPrimary )
                
                    .cornerRadius(8)
            }
            .buttonStyle(.plain)
            .padding([.top, .bottom], 10)
        }
        
        .alert(isPresented: $isAllPaymentInfoChecked) {
            Alert(title: Text("결제 확인"),
                  message: Text("계좌번호 : 1010101010110로 입금부탁드립니다"),
                  dismissButton: .default(Text("확인"),action: {
                isPaymentChecked.toggle()
            }))
        }
        .navigationDestination(isPresented: $isPaymentChecked) {
//            HomeView()
//                .navigationBarBackButtonHidden()
        }
        .background(Color.myBackground)
        .navigationTitle("결제 정보")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .onAppear {
            //tabBarVisible = .hidden
        }
        .onDisappear {
            //tabBarVisible = .visible
        }
    }
    
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PaymentView()
                .environmentObject(ReservationStore())
        }
    }
}
