//
//  UserListView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var userStore: UserStore = UserStore()
    
    var body: some View {
        List(userStore.userList) { user in
            NavigationLink {
                UserDetailView(userStore: userStore, user: user)
            } label: {
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.head1Bold)
                    Text("\(user.nickname)")
                        .font(.captionRegular)
                        .foregroundColor(.myDarkGray)
                }
            }

        }
        .tint(.myMint)
        .navigationTitle("일반 사용자")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .onAppear {
            Task {
                try await userStore.fetchUser()
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserListView()
        }
    }
}
