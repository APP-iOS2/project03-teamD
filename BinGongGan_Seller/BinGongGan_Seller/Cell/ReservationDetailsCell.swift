//
//  ReservationDetailsCell.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationDetailsCell: View {
    @Binding var isPresentedModal : Bool
    //TODO: store와 연결해주기
     var reservationStateType : ReservationStateType = .waitReservation
    
    var body: some View {
        ReservationCell()
            .padding(.bottom, 12)
            .padding(.horizontal, 20)
            .overlay(
                VStack {
                    Button(action: {
                        isPresentedModal.toggle()
                    }) {
                        Image(systemName: "chevron.right")
                            .background(Color.clear)
                            .foregroundColor(Color.myBrown)
                    }
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 40))
                    Spacer()
                }
                    .sheet(isPresented: self.$isPresentedModal) {
                        switch reservationStateType {
                        case .waitReservation :
                            ReservationDetailSheet()
                                .presentationDetents([.medium])
                                .cornerRadius(15)
                        case .cancelReservation :
                            ReservationCancelSheet()
                                .presentationDetents([.medium])
                                .cornerRadius(15)
                        case .confirmedReservation:
                            ReservationConfirmedSheet()
                                .presentationDetents([.medium])
                                .cornerRadius(15)
                        }
                    }
            )
    }
}

struct ReservationDetailsCell_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsCell(isPresentedModal: .constant(false))
    }
}
