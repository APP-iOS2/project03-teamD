//
//  BankAccountSettingView.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct BankAccountSettingView: View {
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: "https://play-lh.googleusercontent.com/HTBCHqXZ01RhNVzIDwsA2ARURfzXeHxoWfsmgH92ieCgIG1CuPpJRWqCfJ9KgkwWStko")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 25, maxHeight: 25)
                            .clipShape(Circle())
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text("카카오뱅크")
                        .font(.body1Bold)
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            //TODO: 수정 페이지로 이동
                        } label: {
                            Text("수정")
                                .font(.captionRegular)
                                .foregroundColor(.myMediumGray)
                                .underline()
                        }
                        .buttonStyle(.plain)
                    }
                }
                HStack {
                    Text("3333123456789")
                        .font(.captionBold)
                        .foregroundColor(.myMediumGray)
                    Divider()
                        .frame(width: 1, height: 15)
                        .background(Color.myLightGray)
                    Text("손윤호")
                        .font(.captionRegular)
                        .foregroundColor(.myMediumGray)
                }
            }
        }
        .padding(.top, -20)
        .navigationTitle("계좌 관리")
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .customBackbutton()
    }
}

struct BankAccountSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BankAccountSettingView()
        }
    }
}
