//
//  ReservationCell.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReservationCell: View {
    @State private var isPresentedModal: Bool = false
    var reservationStateType: ReservationStateType = .waitReservation
    @State var isHiddenRightButton: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ReservationDeadlineCell()
                Spacer()
                
                if isHiddenRightButton {
                    Button {
                        isPresentedModal.toggle()
                    } label: {
                        Image(systemName: "chevron.right")
                            .background(Color.clear)
                            .foregroundColor(Color.myBrown)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.bottom, 5)
            
            HStack {
                Text("ABCD키친")
                    .font(.headline)
                    .bold()
                
                Text("#132")
                    .font(.headline)
                    .bold()
            }
            .foregroundColor(Color.black)
            .padding(.bottom, 5)
            
            HStack {
                Text("인원")
                    .font(.subheadline)
                    .foregroundColor(Color.myBrown)
                Spacer()
                Text("오영석 외 3명")
                    .foregroundColor(Color.black)
            }
            .padding(.bottom, 5)
            
            HStack{
                Text("일정")
                    .font(.subheadline)
                    .foregroundColor(Color.myBrown)
                Spacer()
                Text("09월 13일 11:00 - 12:00")
                    .foregroundColor(Color.black)
            }
            .padding(.bottom, 5)
            
            HStack{
                Text("번호")
                    .font(.subheadline)
                    .foregroundColor(Color.myBrown)
                Spacer()
                Image(systemName: "phone.fill")
                    .foregroundColor(Color.black)
                Text("010-7320-9330")
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
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
    }
}

struct ReservationCell_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCell(isHiddenRightButton: true)
    }
}
