//
//  ContentView.swift
//  BinGongGan_Seller
//
//  Created by 박지현 on 2023/09/11.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var signInStore: SignInStore = SignInStore()

    var body: some View {
        if signInStore.isSuccessSignIn {
            HomeView()
        } else {
            NavigationStack {
                SellerSignInView()
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
