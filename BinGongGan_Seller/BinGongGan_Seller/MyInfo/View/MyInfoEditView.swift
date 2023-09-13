//
//  MyInfoEditView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/08.
//

import SwiftUI

struct MyInfoEditView: View {
    @EnvironmentObject private var myInfo: MyInfoStore
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var accountNumber: String = "인증 필요"
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Binding var isShowingEditSheet: Bool
    @StateObject private var placeStore: PlaceStore = PlaceStore()
    @EnvironmentObject private var myInfoStore: MyInfoStore
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("이메일")
                                .frame(width: 120, alignment: .leading)
                            Text(myInfoStore.myInfo.email)
                            TextField(myInfoStore.myInfo.email, text: $email)
                                .autocapitalization(.none) // 자동 대문자 변환 끄기
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("연락처")
                                .frame(width: 120, alignment: .leading)
                            Text(myInfoStore.myInfo.phoneNumber)
                            TextField(myInfoStore.myInfo.email, text: $phoneNumber)
                                .autocapitalization(.none) // 자동 대문자 변환 끄기
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("계좌번호")
                                .frame(width: 120, alignment: .leading)
                            TextField("", text: $accountNumber)
                                .foregroundColor(.myDarkGray)
                                .autocapitalization(.none) // 자동 대문자 변환 끄기
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
                        if !isValidEmail(email) {
                            showAlert = true
                            alertMessage = "이메일 형식이 올바르지 않습니다."
                        } else if phoneNumber.isEmpty {
                            showAlert = true
                            alertMessage = "연락처를 입력해주세요."
                        } else if accountNumber.isEmpty {
                            showAlert = true
                            alertMessage = "계좌번호를 입력해주세요."
                        } else {
                            isShowingEditSheet.toggle()
                        }
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
        .alert(isPresented:$showAlert) {
            Alert(title: Text(""), message: Text(alertMessage), dismissButton: .default(Text("확인")))
        }
    }
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

struct MyInfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoEditView(isShowingEditSheet: .constant(true))
    }
}
