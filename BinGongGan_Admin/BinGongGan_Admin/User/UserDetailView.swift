//
//  UserDetailView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct UserDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var userStore: UserStore
    @State private var isShowingAlert: Bool = false
    var user: User
    
    var body: some View {
        Form {
            Section("이름(닉네임)") {
                Text(user.name)
                    .font(.head1Bold)
                + Text(" (\(user.nickname))")
                    .font(.body1Regular)
                    .foregroundColor(.myDarkGray)
            }
            Section("이메일") {
                Text(user.email)
            }
            Section("핸드폰 번호") {
                Text(user.phoneNumber)
            }
            Section("생일") {
                Text(user.birthDate)
            }
            if let accountBank = user.accountBank, let accountHolder = user.accountHolder, let accountNumber = user.accountNumber {
                Section("환불 계좌 정보") {
                    Text("(\(accountBank)) \(accountNumber) \(accountHolder)")
                }
            }
            Button {
                isShowingAlert.toggle()
            } label: {
                Text("유저 삭제")
                    .buttonStyle(backgroundColor: Color.myBrown)
            }
            .listRowBackground(Color.myBackground)
        }
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .navigationTitle("\(user.name) 정보")
        .alert("사용자 삭제", isPresented: $isShowingAlert) {
            Button("취소", role: .cancel) {}
            Button("삭제", role: .destructive) {
                Task {
                    guard let id = user.id else { return }
                    try await userStore.removeUser(userId: id)
                }
                dismiss()
            }
        }message: {
            Text("해당 유저를 삭제합니다.")
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userStore: UserStore(), user: User(id: "", email: "aaa", name: "aaa", nickname: "dfdfd", phoneNumber: "010-1010-0000", password: "asdhfjkahjk", birthDate: "121212"))
    }
}
