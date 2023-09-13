//
//  ReservationCells.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/14.
//


import SwiftUI
import BinGongGanCore

struct ReservationCells: View {
    
    @EnvironmentObject private var rervationCalendarStore : RervationCalendarStore
    let data : SellerReservation
    @State private var isPresentedModal: Bool = false
    var reservationStateType: ReservationStateType = .waitReservation
    @State var isHiddenRightButton: Bool
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ReservationDeadlineCell(date:data.calcDate ?? "")
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
                Text(data.reservationName)
                .font(.headline)
                .bold()
            
                Text(data.id)
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
            Text("\(data.reservationName) 외 \(data.personnel)명")
                .foregroundColor(Color.black)
        }
        .padding(.bottom, 5)
        
        HStack{
            Text("일정")
                .font(.subheadline)
                .foregroundColor(Color.myBrown)
            Spacer()
            Text(data.checkInDateString)
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
            Text(data.reservationPhoneNumber)
                .foregroundColor(Color.black)
        }
    }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .sheet(isPresented: self.$isPresentedModal) {
            switch rervationCalendarStore.selectedType {
            case .waitReservation :
                ReservationDetailSheet(data: data)
                    .presentationDetents([.medium])
                    .cornerRadius(15)
            case .cancelReservation :
                ReservationCancelSheet(data: data)
                    .presentationDetents([.medium])
                    .cornerRadius(15)
            case .confirmedReservation:
                ReservationConfirmedSheet(data: data)
                    .presentationDetents([.medium])
                    .cornerRadius(15)
            }
        }
    }
}

struct ReservationCells_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCells(data: SellerReservation(id: "", userEmail: "", roomID: "", reservationYear: "", reservationMonth: "", reservationDay: "", checkInYear: "", checkInMonth: "", checkInDay: "", checkOutYear: "", checkOutMonth: "", checkOutDay: "", placeID: "", hour: 0, personnel: 0, reservationName: "", reservationPhoneNumber: "", reservationRequest: "", reservationState: 0), isHiddenRightButton: true)
    }
}
