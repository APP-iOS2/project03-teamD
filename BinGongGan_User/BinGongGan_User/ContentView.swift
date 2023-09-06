//
//  ContentView.swift
//  BinGongGan_User
//
//  Created by 최하늘 on 2023/09/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var store = SignUpStore()
    var body: some View {
        VStack {
            SignUpView()
                .environmentObject(store)
        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
