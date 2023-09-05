//
//  SettingListView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI

struct SettingListView: View {
    @Binding var isShowingSetting: Bool
    var body: some View {
        VStack {
            Form {
                Button {
                    isShowingSetting = false
                } label: {
                    Text("로그아웃")
                }

            }
        }
        
    }
    
}

struct SettingListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingListView(isShowingSetting: .constant(false))
    }
}
