//
//  MyInfoVIew.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyInfoView: View {
    @StateObject private var placeStore: PlaceStore = PlaceStore()
    @EnvironmentObject private var myInfoStore: MyInfoStore
    @State private var alertMessage = ""
    @State private var isShowAlert: Bool = false
    @State private var logOutToggle: Bool = false
    
    
    var body: some View {
        Form {
            NavigationLink {
                
            } label: {
                HStack {
                    Text("닉네임")
                        .font(.body1Regular)
                    Spacer()
                    Text("\(myInfoStore.myInfo.nickname)")
                        .foregroundColor(.myDarkGray)
                }
            }
            
            NavigationLink {
//                MyInfoEditView(editType: .phoneNumber, phoneNumber)
            } label: {
                HStack {
                    Text("연락처")
                        .font(.body1Regular)
                    Spacer()
                    Text("\(myInfoStore.myInfo.phoneNumber)")
                        .foregroundColor(.myDarkGray)
                }
            }
            
            NavigationLink {
                
            } label: {
                HStack {
                    Text("계좌번호")
                        .font(.body1Regular)
                    Spacer()
                    Text("\(myInfoStore.myInfo.accountNumber)")
                        .foregroundColor(.myDarkGray)
                }
            }
            
            HStack {
                Text("이름")
                    .font(.body1Regular)
                Spacer()
                Text("\(myInfoStore.myInfo.name)")
                    .foregroundColor(.myDarkGray)
            }
            
            HStack {
                Text("이메일")
                    .font(.body1Regular)
                Spacer()
                Text("\(myInfoStore.myInfo.email)")
                    .foregroundColor(.myDarkGray)
            }
            
            HStack {
                Text("생년월일")
                    .font(.body1Regular)
                Spacer()
                Text("\(myInfoStore.myInfo.birthDate)")
                    .foregroundColor(.myDarkGray)
            }
            
            HStack {
                Text("사업자 등록번호")
                    .font(.body1Regular)
                Spacer()
                Text("\(myInfoStore.myInfo.registrationNum)")
                    .foregroundColor(.myDarkGray)
            }
            
            Section {
                Button {
                    isShowAlert.toggle()
                    alertMessage = "로그아웃 하시겠습니까?"
                } label: {
                    Text("로그아웃")
                        .foregroundColor(.myDarkGray)
                }
                .buttonStyle(.plain)
                
                Button {
                    isShowAlert.toggle()
                    alertMessage = "정말 탈퇴 하시겠습니까?"
                } label: {
                    Text("회원 탈퇴")
                        .foregroundColor(.red)
                }
                
                NavigationLink {
                    PlaceAddView()
                        .environmentObject(placeStore)
                } label: {
                    Text("임시 공간 추가 버튼")
                }
            }
        }
        .navigationTitle("내 정보")
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .customBackbutton()
        .background(Color.myBackground)
        .alert(isPresented:$isShowAlert) {
            Alert(title: Text(""),
                  message: Text(alertMessage),
                  primaryButton: .default(Text("확인"),
                                          action: {
                if alertMessage == "로그아웃 하시겠습니까?" {
                    logOutToggle.toggle()
                } else if alertMessage == "정말 탈퇴 하시겠습니까?" {
                }}),
                  secondaryButton: .cancel(Text("취소")))
        }
        
        .navigationDestination(isPresented: $logOutToggle) {
            HomeView() // 로그인뷰로 이동
                .navigationBarBackButtonHidden()
        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInfoView()
                .environmentObject(MyInfoStore())
        }
    }
}
