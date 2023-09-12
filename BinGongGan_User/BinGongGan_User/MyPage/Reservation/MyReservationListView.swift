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
    case success = "완료 내역"
    case cancel = "취소 내역"
}

struct MyReservationListView: View {
    
    @State private var selectedPicker: ReservationHistoryType = .all
    @State private var isShowingGongGanDetailView: Bool = false
    @State private var reservation: ReservationModel = ReservationModel(placeName: "", reservationNumber: "", reservationDate: "", reservationTime: "" , reservationPersonal: 1, placeAddress: "", isReservation: false)
    
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingSheet = true
                } label: {
                    HStack {
                        Text(selectedPicker.rawValue)
                        Image(systemName: "arrowtriangle.down.fill")
                    }
                    .padding(10)
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                            .shadow(color: .myBackground, radius: 5, x: 3, y: 3)
                    )
                }
            }.padding(.trailing)
            
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
                        
                    case .cancel:
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
        .sheet(isPresented: $isShowingSheet) {
            CategorySheetView(isShowingSheet: $isShowingSheet, selectedPicker: $selectedPicker)
        }
    }
}

struct MyReservationListView_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationListView()
    }
}
