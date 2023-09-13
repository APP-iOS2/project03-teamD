//
//  MyPageMainView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyPageMainView: View {
    @EnvironmentObject var myUserStore: MyUserStore
    @EnvironmentObject var signInStore: SignInStore
    @EnvironmentObject private var myReservationStore: MyReservationStore
    
    @State private var isShowingSetting: Bool = false
    @State private var isShowingLogoutAlert: Bool = false
    @State private var isShowingActionSheet: Bool = false
    @State private var isLoading: Bool = true

    var currentUser: User? {
        return myUserStore.currentUser
    }
    
    var body: some View {
        Form {
            Section("내 정보") {
                NavigationLink {
                    MyInformationDetailView()
                } label: {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("\(currentUser?.nickname ?? "이름정보없음")")
                        Text("\(currentUser?.email ?? "test1234@test.com")")
                            .foregroundColor(.myMediumGray)
                            .font(.caption)
                        Spacer()
                    }
                }
            } //Section - 내정보

            Section("예약/리뷰") {
                NavigationLink("예약 내역") {
                    MyReservationListView()
                }

                NavigationLink("내 리뷰") {
                    MyReviewListView()
                }
            }//Section - 예약 리뷰

            Section("고객센터") {
                NavigationLink("1 : 1 문의하기") {
                    EnquiryView()
                }

                NavigationLink("자주 묻는 질문 FAQ") {
                    FAQView()
                }

            } //Section - 고객센터

            Section("기타") {
                NavigationLink("공지사항") {
                    AnnouncementView()
                }

                NavigationLink("빈공간 정보") {
                    AppInformationList()
                }
            } // Section - 기타
            Section("로그아웃") {
                Button {
                    isShowingLogoutAlert.toggle()
                } label: {
                    Text("로그아웃")
                        .foregroundColor(.red)
                }
            }
        } //Form
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationTitle("My 빈공간")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingSetting.toggle()
                }label: {
                    Image(systemName: "gearshape")
                        .foregroundColor(.myBrown)
                }
            }
        }
        .navigationDestination(isPresented: $isShowingSetting) {
            SettingListView()
        }
        .alert("로그아웃", isPresented: $isShowingLogoutAlert) {
            Button("취소", role: .cancel) {}
            Button("로그아웃", role: .destructive) {
                //TODO: 로그아웃
                signInStore.signOut()
            }
        } message: {
            Text("로그아웃을 합니다.")
        }
        .confirmationDialog("", isPresented: $isShowingActionSheet) {

            Button("통화 02-0000-0000", role: .none) {}
            Button("취소", role: .cancel) {}

        }
        .onAppear{
            myReservationStore.selectedPicker = .all
            Task {
                try await myUserStore.fetchCurrentUser()
                self.isLoading = false
                try await myReservationStore.fetchMyReservations(currentUser: currentUser?.email ?? "test1234@test.com")
            }
        }
        .redacted(reason: isLoading ? .placeholder : [])
    }
}

struct MyPageMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPageMainView()
                .environmentObject(MyUserStore())
                .environmentObject(SignInStore())
        }
    }
}



