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
    
    var body: some View {
        VStack {
            tabAnimate()
            List {
                ForEach(reservates) { reservate in
                    switch selectedPicker {
                    case .all:
                            NavigationLink {
                                ReservationDetailView(reservate: reservate)
                            } label: {
                                MyReservationRowView(reservate: reservate)
                            }
                            
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(reservate.isReservation ? .myPrimary : .white)
                                    .shadow(color: .gray, radius: 5, x: 3, y: 3)
                            )
                            
                    case .expect:
                        if !reservate.isReservation {
                                NavigationLink {
                                    ReservationDetailView(reservate: reservate)
                                } label: {
                                    MyReservationRowView(reservate: reservate)
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                )
                           
                        }
                    case .success:
                        if reservate.isReservation {
                           
                                NavigationLink {
                                    ReservationDetailView(reservate: reservate)
                                } label: {
                                    MyReservationRowView(reservate: reservate)
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.myPrimary)
                                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                )
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
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
