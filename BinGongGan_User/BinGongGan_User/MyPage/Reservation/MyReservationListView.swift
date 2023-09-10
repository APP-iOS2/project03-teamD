//
//  MyReservationListView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI

enum ReservationHistoryType: String , CaseIterable {
    case all = "전체 내역"
    case expect = "예정 내역"
    case success = "완료된 내역"
}
struct MyReservationListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectedPicker: ReservationHistoryType = .all
    @Namespace private var animation
    @State private var isShowingGongGanDetailView: Bool = false
    @State private var reservation: ReservationModel = ReservationModel(placeName: "", reservationNumber: "", reservationDate: "", reservationTime: "" , reservationPersonal: 1, placeAddress: "", isReservation: false)
    
    var body: some View {
        VStack {
            tabAnimate()
            List {
                ForEach(reservates) { reservate in
                    switch selectedPicker {
                    case .all:
                        Button {
                            isShowingGongGanDetailView = true
                            reservation = reservate
                        } label: {
                            MyReservationRowView(reservate: reservate)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(reservate.isReservation ? .myBackground : .white)
                                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                    
                                )
                        }
                        
                    case .expect:
                        if !reservate.isReservation {
                            Button {
                                isShowingGongGanDetailView = true
                                reservation = reservate
                            } label: {
                                MyReservationRowView(reservate: reservate)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(reservate.isReservation ? .myBackground : .white)
                                            .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                    )
                            }
                            
                            
                            
                        }
                    case .success:
                        if reservate.isReservation {
                            
                            Button {
                                isShowingGongGanDetailView = true
                                reservation = reservate
                            } label: {
                                MyReservationRowView(reservate: reservate)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(reservate.isReservation ? .myBackground : .white)
                                            .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                    )
                            }
                            
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            Spacer()
        }
        .navigationTitle("예약 내역")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .navigationDestination(isPresented: $isShowingGongGanDetailView) {
            GongGanDetailView()
        }
    }
    
    @ViewBuilder
    private func tabAnimate() -> some View {
        HStack {
            ForEach(ReservationHistoryType.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.footnote)
                        .frame(maxWidth: .infinity/6, minHeight: 30)
                        .foregroundColor(selectedPicker == item ? .black : .gray)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.myPrimary)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                    
                }
                .padding()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct MyReservationListView_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationListView()
    }
}
