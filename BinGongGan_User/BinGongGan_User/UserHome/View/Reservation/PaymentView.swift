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
                
                PaymentListCell(title: "방식", data: "무통장 입금 seller/ 통장번호")
                    .foregroundColor(.red)
                    .listRowBackground(Color.clear)
                
                PaymentListCell(title: "신청일", data: "reservationDate")
                    .listRowBackground(Color.clear)
                
                PaymentListCell(title: "예약공간", data: "spaceName / roomName")
                    .listRowBackground(Color.clear)
                
                PaymentListCell(title: "예약내용", data: "checkInDate / checkOutDate/ hour")
                    .listRowBackground(Color.clear)
                
                PaymentListCell(title: "예약인원", data: "personal")
                    .listRowBackground(Color.clear)
                
                PaymentListCell(title: "예약자정보", data: "reservationName / reservationPhoneNumber")
                    .listRowBackground(Color.clear)
                
                PaymentListCell(title: "요청사항", data: "reservationRequest")
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
