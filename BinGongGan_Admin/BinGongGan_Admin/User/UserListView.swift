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
                UserDetailView(user: user)
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
