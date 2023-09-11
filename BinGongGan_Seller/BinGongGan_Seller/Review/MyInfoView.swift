//
//  MyInfoVIew.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyInfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                NavigationLink {
//                    MyInformationEditView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("이름")
                            .font(.body1Regular)
                        Text("윤경환")
                            .font(.body1Bold)
                            .foregroundColor(.myDarkGray)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                NavigationLink {
//                    MyInformationEditView()
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
                Text("사업자 등록번호")
                    .font(.body1Regular)
                Text("111-11-12345")
                    .font(.body1Bold)
                    .foregroundColor(.myDarkGray)
            }
            
            VStack(alignment: .leading) {
                Text("계좌번호")
                    .font(.body1Regular)
                Text("123456-02-123456")
                    .font(.body1Bold)
                    .foregroundColor(.myDarkGray)
            }
            
            Section {
                Button {
                    
                } label: {
                    Text("로그아웃")
                        .foregroundColor(.myDarkGray)
                }
                
                Button {
                    
                } label: {
                    Text("회원 탈퇴")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("내 정보")
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myBrown)
                }
            }
        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInfoView()
        }
    }
}
