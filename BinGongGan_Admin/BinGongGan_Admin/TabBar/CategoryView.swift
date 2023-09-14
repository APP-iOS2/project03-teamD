//
//  CategoryView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct CategoryView: View {
    var body: some View {
        Form {
            //MARK: - 공지 관리
            Section("공지 관리") {
                NavigationLink {
                    AnnouncementListView()
                } label: {
                    Label {
                        Text("공지 관리")
                    } icon: {
                        Image(systemName: "megaphone.fill")
                            .foregroundColor(.myBrown)
                    }
                }
            }
            //MARK: - 사용자 관리
            Section("사용자 관리") {
                NavigationLink {
                    UserListView()
                } label: {
                    Label {
                        Text("전체 일반 사용자")
                    } icon: {
                        Image(systemName: "person.fill")
                            .foregroundColor(.myBrown)
                    }
                }
                NavigationLink {
                    SellerListView()
                } label: {
                    Label {
                        Text("전체 판매자")
                    } icon: {
                        Image(systemName: "person.fill")
                            .foregroundColor(.myBrown)
                    }
                }
            }
            //MARK: - 게시글 관리
            Section("게시글 관리") {
                NavigationLink {
                    PostingListView()
                } label: {
                    Label {
                        Text("전체 게시글")
                    } icon: {
                        Image(systemName: "pencil.line")
                            .foregroundColor(.myBrown)
                    }
                }
            }
            //MARK: - 댓글 관리
            Section("댓글 관리") {
                NavigationLink {
                   ReviewListView()
                } label: {
                    Label {
                        Text("전체 댓글")
                    } icon: {
                        Image(systemName: "quote.bubble.fill")
                            .foregroundColor(.myBrown)
                    }
                }
                
                NavigationLink {
                    ReplyListView()
                } label: {
                    Label {
                        Text("판매자 답글")
                    } icon: {
                        Image(systemName: "quote.bubble.fill")
                            .foregroundColor(.myBrown)
                    }
                }
            }
            //MARK: - 신고 관리
            Section("신고 관리") {
                NavigationLink {
                    ReportListView()
                } label: {
                    Label {
                        Text("신고된 댓글 관리")
                    } icon: {
                        Image(systemName: "exclamationmark.square.fill")
                            .foregroundColor(.myBrown)
                    }
                }
            }
        }
        .tint(.myMint)
        .navigationTitle("관리자 시스템")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoryView()
        }
    }
}
