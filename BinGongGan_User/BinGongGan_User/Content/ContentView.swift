//
//  MainView.swift
//  BinGongGan_User
//
//  Created by 최하늘 on 2023/09/07.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var signInStore: SignInStore = SignInStore()
    @StateObject private var signUpStore: SignUpStore = SignUpStore()
    @StateObject private var homeStore: HomeStore = HomeStore()
    @StateObject private var reservationStore: ReservationStore = ReservationStore()
    @StateObject private var myReservationStore: MyReservationStore = MyReservationStore()
    @StateObject private var myReviewStore: MyReviewStore = MyReviewStore()
  
    var body: some View {
        if signInStore.isSuccessSignIn {
            GongGanTabView()
                .environmentObject(signInStore)
                .environmentObject(homeStore)
                .environmentObject(reservationStore)
                .environmentObject(myReservationStore)
                .environmentObject(myReviewStore)
        } else {
            NavigationStack {
                SignInView()
                    .environmentObject(signInStore)
                    .environmentObject(signUpStore)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

