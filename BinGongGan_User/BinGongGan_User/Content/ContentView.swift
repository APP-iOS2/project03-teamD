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
    @StateObject private var myUserStore: MyUserStore = MyUserStore()
    @StateObject private var gongGanStore: GongGanStore = GongGanStore()
    @StateObject private var favoriteGongGanStore: MyFavoriteStore = MyFavoriteStore()
  
    var body: some View {
        if signInStore.isSignedIn {
            GongGanTabView()
                .environmentObject(signInStore)
                .environmentObject(homeStore)
                .environmentObject(reservationStore)
                .environmentObject(myReservationStore)
                .environmentObject(myReviewStore)
                .environmentObject(myUserStore)
                .environmentObject(gongGanStore)
                .environmentObject(favoriteGongGanStore)
        } else {
            NavigationStack {
                SignInView()
                    .environmentObject(signInStore)
                    .environmentObject(signUpStore)
                    .environmentObject(myUserStore)
                    .onAppear {
                        let result = signInStore.checkSignedIn()
                        if result {
                            Task {
                                try                             myUserStore.fetchCurrentUser
                            }
                        }
                    }
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

