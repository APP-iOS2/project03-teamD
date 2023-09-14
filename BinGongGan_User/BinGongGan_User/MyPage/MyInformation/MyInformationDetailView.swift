//
//  MyInformationDetail.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyInformationDetailView: View {
    @EnvironmentObject var myUserStore: MyUserStore
    
    private var formattedPhoneNumber: String {
        currentUser.phoneNumber.formatPhoneNumber()
    }
    private var formattedBirthDate: String {
        currentUser.birthDate.formatBirthDate()
    }
    var currentUser: User {
        myUserStore.currentUser
    }
    
    var body: some View {
        Form {
            NavigationLink {
                MyInformationEditView(currentUser: currentUser, editType: .name)
            } label: {
                HStack {
                    Text("닉네임")
                        .font(.body1Regular)
                    Spacer()
                    Text("\(currentUser.nickname)")
                        .foregroundColor(.myDarkGray)
                }
            }
            
            NavigationLink {
                MyInformationEditView(currentUser: currentUser, editType: .phoneNumber)
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
                Text("\(currentUser.name)")
                    .foregroundColor(.myDarkGray)
            }
            
            HStack {
                Text("아이디")
                    .font(.body1Regular)
                Spacer()
                Text("\(currentUser.email)")
                    .foregroundColor(.myDarkGray)
            }
            
            HStack {
                Text("생년월일")
                    .font(.body1Regular)
                Spacer()
                Text(formattedBirthDate)
                    .foregroundColor(.myDarkGray)
            }
            
            Section {
                NavigationLink {
                    BankAccountSettingView(currentUser: currentUser)
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
                .environmentObject(MyUserStore())
        }
    }
}
