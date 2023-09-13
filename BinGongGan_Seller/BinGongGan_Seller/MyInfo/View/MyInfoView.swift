//
//  MyInfoVIew.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyInfo: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var email: String
    var phoneNumber: String
    var accountNumber: String
    var companyNumber: String
}
class MyStore: ObservableObject {
    @Published var myStore: MyInfo = MyInfo(name: "윤경환", email: "test@gmail.com", phoneNumber: "010-1234-1234", accountNumber: "123456-02-123456", companyNumber: "111-11-12345")
}


struct MyInfoView: View {
    @StateObject private var placeStore: PlaceStore = PlaceStore()
    @EnvironmentObject private var myStore: MyStore

    @State private var alertMessage = ""
    @State private var isShowAlert: Bool = false
    @State private var logOutToggle: Bool = false
    @State private var isShowingEditSheet: Bool = false
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    Text("이름")
                        .font(.body1Regular)
                    Text(myStore.myStore.name)
                        .font(.body1Bold)
                        .foregroundColor(.myDarkGray)
                }
                
                VStack(alignment: .leading) {
                    Text("이메일")
                        .font(.body1Regular)
                    Text(myStore.myStore.email)
                        .font(.body1Bold)
                        .foregroundColor(.myDarkGray)
                }
                
                VStack(alignment: .leading) {
                    Text("연락처")
                        .font(.body1Regular)
                    Text(myStore.myStore.phoneNumber)
                        .font(.body1Bold)
                        .foregroundColor(.myDarkGray)
                }
                
                VStack(alignment: .leading) {
                    Text("계좌번호")
                        .font(.body1Regular)
                    Text(myStore.myStore.accountNumber)
                        .font(.body1Bold)
                        .foregroundColor(.myDarkGray)
                }
                
                VStack(alignment: .leading) {
                    Text("사업자 등록번호")
                        .font(.body1Regular)
                    Text(myStore.myStore.companyNumber)
                        .font(.body1Bold)
                        .foregroundColor(.myDarkGray)
                }
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    isShowingEditSheet.toggle()
                } label: {
                    Text("수정")
                        .accentColor(.black)
                }
            }
        }
        .sheet(isPresented: $isShowingEditSheet, content: {
            MyInfoEditView(isShowingEditSheet: $isShowingEditSheet)
        })
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
                .environmentObject(MyStore())
        }
    }
}
