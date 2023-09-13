//
//  EnquiryView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI

struct EnquiryView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingActionSheet = false
    @State private var isHiddenEmailInfo = false
    @State private var isShowingToast: Bool = false
    var body: some View {
        List {
            Section("문의 방법") {
                Button {
                    isShowingActionSheet.toggle()
                } label: {
                    HStack {
                        Text("")
                        Image(systemName: "phone.fill")
                        Text("상담원 연결")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.myBrown)
                    }
                    
                }
                ZStack {
                    NavigationLink {
                        EnquiryFormView(isShowingToast: $isShowingToast)
                    } label: {
                        EmptyView()
                    }
                    HStack {
                        Text("")
                        Image(systemName: "envelope.fill")
                        Text("이메일 문의")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.myBrown)
                    }
                }
            }
        }
        .foregroundColor(.myDarkGray)
        .navigationTitle("1 : 1 문의")
        .customBackbutton()
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .confirmationDialog("", isPresented: $isShowingActionSheet) {
            Button("통화 02-0000-0000", role: .none) {}
            Button("취소", role: .cancel) {}
        }
        .toast(isShowing: $isShowingToast, message: "이메일을 전송했습니다.")
    }
}

struct EnquiryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnquiryView()
        }
    }
}
