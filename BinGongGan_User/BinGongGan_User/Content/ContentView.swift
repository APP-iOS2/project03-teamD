//
//  MainView.swift
//  BinGongGan_User
//
//  Created by 최하늘 on 2023/09/07.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var signInStore: SignInStore = SignInStore()
    @StateObject private var reservationStore: ReservationStore = ReservationStore()

    var body: some View {
        if signInStore.isSuccessSignIn {
            GongGanTabView()
                .environmentObject(reservationStore)
                .environmentObject(signInStore)
        } else {
            NavigationStack {
                SignInView()
                    .environmentObject(signInStore)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

