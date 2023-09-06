//
//  MyPageMainView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyPageMainView: View {
    @State var isShowingSetting: Bool = false
    var body: some View {
        NavigationStack {
            Form {
                Section("내 정보") {
                    NavigationLink {
                        MyInformationDetailView()
                    } label: {
                        HStack {
                            Circle()
                                .frame(width: min(80, UIScreen.main.bounds.width * 0.3), height: min(80, UIScreen.main.bounds.height * 0.3))
                                .foregroundColor(.myPrimary)
                                .padding(.trailing)
                            VStack(alignment: .leading) {
                                Text("손윤호")
                                Text("test@test.com")
                                    .tint(.gray)
                                    .font(.caption)
                            }
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
                        
                    }
                } // Section - 기타
            } //Form
            .navigationTitle("My 빈공간")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSetting.toggle()
                    }label: {
                        Image(systemName: "gearshape")
                            .foregroundColor(.myPrimary)
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowingSetting) {
                NavigationStack {
                    SettingListView()
                }
            }
        }
    }
}

struct MyPageMainView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMainView()
    }
}


