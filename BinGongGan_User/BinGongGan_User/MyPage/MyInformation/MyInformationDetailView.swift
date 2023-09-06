//
//  MyInformationDetail.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyInformationDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                NavigationLink {
                    MyInformationEditView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("이름")
                            .font(.body1Regular)
                        Text("손윤호")
                            .font(.body1Bold)
                            .foregroundColor(.myDarkGray)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                NavigationLink {
                    MyInformationEditView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("연락처")
                            .font(.body1Regular)
                        Text("010-1234-5678")
                            .font(.body1Bold)
                            .foregroundColor(.myDarkGray)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("아이디")
                    .font(.body1Regular)
                Text("test@test.com")
                    .font(.body1Bold)
                    .tint(.myDarkGray)
            }
            
            VStack(alignment: .leading) {
                Text("생년월일")
                    .font(.body1Regular)
                Text("2000-01-01")
                    .font(.body1Bold)
                    .foregroundColor(.myDarkGray)
            }
            
            Section {
                Button {
                    
                } label: {
                    Text("회원 탈퇴")
                        .foregroundColor(.red)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationTitle("내 정보")
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

struct MyInformationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInformationDetailView()
        }
    }
}
