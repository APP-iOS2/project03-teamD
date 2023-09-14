//
//  MyReservationListView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore


struct MyReservationListView: View {
    @EnvironmentObject var myUserStore: MyUserStore
    @EnvironmentObject private var myReservationStore: MyReservationStore
    @State private var isShowingGongGanDetailView: Bool = false
    @State private var isShowingSheet: Bool = false
    
    var currentUser: User? {
        return myUserStore.currentUser
    }
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingSheet = true
                } label: {
                    HStack {
                        Text(myReservationStore.selectedPicker.rawValue)
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
            }
            .padding(.trailing)

            if myReservationStore.filteredReservations.count == 0 {
                Spacer()
                Text("예약 내역이 없습니다")
                Spacer()
            } else {
                List {
                    ForEach(myReservationStore.filteredReservations) { reservate in
                        Button {
                            isShowingGongGanDetailView = true
                            myReservationStore.reservation = reservate
                        } label: {
                            MyReservationRowView(reservation: reservate)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                )
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            Spacer()
        }
        .navigationTitle("예약 내역")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .navigationDestination(isPresented: $isShowingGongGanDetailView) {
            GongGanDetailView(placeId: myReservationStore.reservation.placeID)
        }
        .sheet(isPresented: $isShowingSheet) {
            CategorySheetView(isShowingSheet: $isShowingSheet)
        }
//        .toast(isShowing: $isShowingToast, message: "이미지는 최대 5개까지 가능합니다.")
        .refreshable {
            Task {
                try await myUserStore.fetchCurrentUser()
                try await myReservationStore.fetchMyReservations(currentUser: currentUser?.email ?? "test1234@test.com")
            }
        }
    }
}

struct MyReservationListView_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationListView()
            .environmentObject(MyUserStore())
            .environmentObject(MyReservationStore())
        
    }
}
