//
//  ReservationConfirmedCell.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationConfirmedCell: View {
    @Binding var showModal : Bool
    var body: some View {
        Button(action: {
            self.showModal = true
        },
               label: {
            ReservationCell()
                .sheet(isPresented: self.$showModal) {
                    ReservationListModalView()
                        .presentationDetents([.medium])
                        .cornerRadius(15)
                }
        })
        .buttonStyle(.plain)
        .overlay(
            Button(action: {
            }) {
                Text("예약확정")
                    .font(.subheadline)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 40)
        )
    }
}

struct ReservationConfirmedCell_Previews: PreviewProvider {
    static var previews: some View {
        ReservationConfirmedCell(showModal: .constant(false))
    }
}
