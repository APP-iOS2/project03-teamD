//
//  ReservationDetailsView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import SwiftUI

struct ReservationDetailsView: View {

    @State private var selectedPicker: ReservationTapType = .list
    @Namespace private var animation
    
    var body: some View {
        VStack {
            animate()
            ReservationTapBarView(reservationTapType: selectedPicker)
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(ReservationTapType.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .frame(maxWidth: .infinity/2, minHeight: 10)
                        .foregroundColor(selectedPicker == item ? .black : .gray)

                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}
struct ReservationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsView()
    }
}

