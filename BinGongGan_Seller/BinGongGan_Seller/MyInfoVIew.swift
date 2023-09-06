//
//  MyInfoVIew.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI

struct ReviewManageDetailView: View {
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var companyRegistrationNumber: String = ""
    @State var accountNumber: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    var buttonWidth : CGFloat {
        UIScreen.main.bounds.width - 40
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                TextField("이름", text: $name)
                    .autocapitalization(.none) // 자동 대문자 변환 끄기
                    .textInputAutocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                TextField("전화번호", text: $phoneNumber)
                    .autocapitalization(.none) // 자동 대문자 변환 끄기
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                TextField("사업자등록번호", text: $companyRegistrationNumber)
                    .autocapitalization(.none) // 자동 대문자 변환 끄기
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                TextField("계좌번호", text: $accountNumber)
                    .autocapitalization(.none) // 자동 대문자 변환 끄기
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                Button {
                    if name.isEmpty {
                        showAlert = true
                        alertMessage = "이름을 입력해주세요."
                    } else if phoneNumber.count > 12 {
                        showAlert = true
                        alertMessage = "전화번호는 11자리 이하이어야 합니다."
                    } else if companyRegistrationNumber.isEmpty {
                        showAlert = true
                        alertMessage = "사업자 등록번호를 입력해 주세요."
                    } else if accountNumber.isEmpty {
                        showAlert = true
                        alertMessage = "계좌번호를 입력해 주세요."
                    }
                    
                } label: {
                    Text("수정 완료")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width:buttonWidth, height: 44)
                        .background(.brown)
                        .cornerRadius(8)
                        .offset(y: 15)
                }
                Button {
                    
                } label: {
                    Text("로그아웃")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width:buttonWidth, height: 44)
                        .background(.brown)
                        .cornerRadius(8)
                        .offset(y: 80)
                }

                Button {
                    
                } label: {
                    Text("계정 삭제")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .frame(width:buttonWidth, height: 44)
                        .background(.brown)
                        .cornerRadius(8)
                        .offset(y: 80)
                }
            }
            .navigationTitle("내 정보")
        }
//        .position(x: 200, y: 280)
        .alert(isPresented:$showAlert) {
            Alert(title: Text(""), message: Text(alertMessage), dismissButton: .default(Text("확인")))
        }
    }
}

struct MyInfoVIew_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoVIew()
    }
}
