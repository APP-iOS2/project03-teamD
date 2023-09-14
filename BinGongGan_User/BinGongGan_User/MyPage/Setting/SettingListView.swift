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
            Section("일반") {
                Toggle("알림", isOn: $isNotificationToggle)
                    .tint(.myBrown)
                Toggle("위치 권한", isOn: $isLocationToggle)
                    .tint(.myBrown)
            }
        }
        .navigationTitle("설정")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct SettingListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingListView()
        }
    }
}
