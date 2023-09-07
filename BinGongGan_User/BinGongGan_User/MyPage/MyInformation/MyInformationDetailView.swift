//
//  MyInformationDetail.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct MyInformationDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = "손윤호"
    @State private var phoneNumber: String = "010-1234-5678"
    @State private var isPresentedAlert: Bool = false
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                NavigationLink {
                    MyInformationEditView(editType: .name, name: $name, phoneNumber: $phoneNumber)
                } label: {
                    HStack {
                        Text("이름")
                            .font(.body1Regular)
                        Spacer()
                        Text("\(name)")
                            .foregroundColor(.myDarkGray)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                NavigationLink {
                    MyInformationEditView(editType: .phoneNumber, name: $name, phoneNumber: $phoneNumber)
                } label: {
                    HStack {
                        Text("연락처")
                            .font(.body1Regular)
                        Spacer()
                        Text("\(phoneNumber)")
                            .foregroundColor(.myDarkGray)
                    }
                }
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
                Text("2000-01-01")
                    .foregroundColor(.myDarkGray)
            }
            
            Section {
                Button {
                    isPresentedAlert.toggle()
                } label: {
                    Text("회원탈퇴")
                        .foregroundColor(.red)
                }
                .alert("회원탈퇴", isPresented: $isPresentedAlert) {
                    Button("돌아가기", role: .cancel) { }
                    Button("탈퇴", role: .destructive) { }
                } message: {
                    Text("이 동작은 되돌릴 수 없습니다.")
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationTitle("내 정보")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
        }
    }
}

struct MyInformationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInformationDetailView()
        }
    }
}
