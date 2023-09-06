//
//  AppInformationList.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI

struct AppInformationList: View {
    @Environment(\.dismiss) private var dismiss
    
    private let informationList: [String] = [
        "이용약관",
        "개인정보처리방침",
        "위치 정보 이용 약관",
        "전자금융거래 이용 약관",
        "전자금융거래 이용자 유의사항",
        "OpenSource License"
    ]
    
    var body: some View {
        List(informationList, id: \.self) { item in
            NavigationLink {
                
            } label: {
                Text(item)
                    .foregroundColor(.myPrimary)
                    .font(.body1Bold)
            }
        }
        .navigationTitle("빈공간 정보")
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

struct AppInformationList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AppInformationList()
        }
    }
}
