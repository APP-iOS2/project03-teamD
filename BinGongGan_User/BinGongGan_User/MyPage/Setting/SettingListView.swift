//
//  SettingListView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct SettingListView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isNotificationToggle: Bool = false
    @State private var isLocationToggle: Bool = false
    
    var body: some View {
        Form {
            Section("계정 설정") {
                NavigationLink("비밀번호 변경") {
                    PasswordEditView()
                }
            }
            
            Section("일반") {
                Toggle("알림", isOn: $isNotificationToggle)
                    .tint(.myPrimary)
                Toggle("위치 권한", isOn: $isLocationToggle)
                    .tint(.myPrimary)
            }
        }
        .navigationTitle("Setting")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
        }
    }
}

struct SettingListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingListView()
        }
    }
}
