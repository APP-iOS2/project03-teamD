//
//  MyInformationDetail.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyInformationDetailView: View {
    @State private var nickName: String = "유노"
    @State private var phoneNumber: String = "01012345678"
    @State private var isPresentedAlert: Bool = false
    private let birthDate: String = "000508"
    private var formattedPhoneNumber: String {
        phoneNumber.formatPhoneNumber()
    }
    
    var body: some View {
        Form {
            NavigationLink {
                MyInformationEditView(editType: .name, name: $nickName, phoneNumber: $phoneNumber)
            } label: {
                HStack {
                    Text("닉네임")
                        .font(.body1Regular)
                    Spacer()
                    Text("\(nickName)")
                        .foregroundColor(.myDarkGray)
                }
            }
            
            NavigationLink {
                MyInformationEditView(editType: .phoneNumber, name: $nickName, phoneNumber: $phoneNumber)
            } label: {
                HStack {
                    Text("연락처")
                        .font(.body1Regular)
                    Spacer()
                    Text("\(formattedPhoneNumber)")
                        .foregroundColor(.myDarkGray)
                }
            }
            
            HStack {
                Text("이름")
                    .font(.body1Regular)
                Spacer()
                Text("손윤호")
                    .foregroundColor(.myDarkGray)
            }
            
            HStack {
                Text("아이디")
                    .font(.body1Regular)
                Spacer()
                Text("test@test.com")
                    .tint(.myDarkGray)
            }
            
            HStack {
                Text("생년월일")
                    .font(.body1Regular)
                Spacer()
                Text(birthDate.formatBirthDate())
                    .foregroundColor(.myDarkGray)
            }
            
            Section {
                NavigationLink {
                    BankAccountSettingView()
                } label: {
                    Text("계좌 관리")
                }
            } header: {
                Text("계좌")
            }
            
            Section {
                NavigationLink {
                    UserAccountSettingView()
                } label: {
                    Text("계정 관리")
                }
            } header: {
                Text("계정")
            }
        }
        .padding(.top, -20)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationTitle("내 정보")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
    }
}

struct MyInformationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInformationDetailView()
        }
    }
}
