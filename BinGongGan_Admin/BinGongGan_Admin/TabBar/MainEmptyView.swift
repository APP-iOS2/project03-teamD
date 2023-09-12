//
//  MainEmptyView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct MainEmptyView: View {
    var body: some View {
        ZStack {
            Color.myBackground.ignoresSafeArea(.all)
            VStack {
                Text("Admin System")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.myBrown)
                Image("HomeLogo")
                    .padding(.vertical, 20)
                VStack {
                    Text("관리자 시스템에 오신걸 환영합니다.")
                    Text("이용하실 메뉴를 선택해주세요.")
                }
                .font(.head1Regular)
                .foregroundColor(.myDarkGray)
            }
        }
    }
}

struct MainEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        MainEmptyView()
    }
}
