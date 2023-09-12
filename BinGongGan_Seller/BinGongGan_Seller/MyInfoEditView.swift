//
//  MyInfoEditView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/08.
//

import SwiftUI

struct MyInfoEditView: View {
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var accountNumber: String = "인증 필요"
    @State var companyNumber: String = ""
    @Binding var isShowingEditSheet: Bool
    @StateObject var myInfo: MyStore
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("이메일")
                                .frame(width: 120, alignment: .leading)
                            TextField("", text: $email)
                            
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
                }
            }
            .navigationTitle("내 정보 수정")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TODO: 저장기능 수행을 꼭 추가하자.
                        isShowingEditSheet.toggle()
                    } label: {
                        Text("저장")
                    }
                    .accentColor(.black)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingEditSheet.toggle()
                    } label: {
                        Text("취소")
                    }
                    .accentColor(.black)
                }
            }
        }
    }
}

struct MyInfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoEditView(isShowingEditSheet: .constant(true), myInfo: MyStore())
    }
}
