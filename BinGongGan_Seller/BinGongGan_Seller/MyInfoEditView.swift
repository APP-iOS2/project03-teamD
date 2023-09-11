//
//  MyInfoEditView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/08.
//

import SwiftUI

struct MyInfoEditView: View {
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var accountNumber: String = "인증 필요"
    @State var companyNumber: String = ""
    @StateObject var myInfo: MyStore
    
    var body: some View {
            VStack {
                Section {
                    Form {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("이름")
                                    .frame(width: 120, alignment: .leading)
                                TextField("", text: $name)
                                
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("연락처")
                                    .frame(width: 120, alignment: .leading)
                                TextField("", text: $phoneNumber)
                                
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("계좌번호")
                                    .frame(width: 120, alignment: .leading)
                                TextField("", text: $accountNumber)
                                    .foregroundColor(.myDarkGray)
                                
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("사업자 등록번호")
                                    .frame(width: 120, alignment: .leading)
                                TextField("", text: $companyNumber)
                                
                            }
                        }
                    }
                }
                .navigationTitle("내 정보 수정")
            }
        .customBackbutton()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    MyInfoView()
                } label: {
                    Button {
                        // TODO: 완료 눌렀을 때 수정된 사항 저장
                    } label: {
                        Text("완료")
                    }
                }
                .accentColor(.black)
            }
        }
    }
}

struct MyInfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInfoEditView(myInfo: MyStore())
        }
    }
}
