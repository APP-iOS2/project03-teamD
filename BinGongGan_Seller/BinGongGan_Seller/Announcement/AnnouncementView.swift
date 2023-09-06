//
//  AnnouncementView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementView: View {
    @State private var announcementText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Text("공지 관리")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.myPrimary)
                        .padding([.top, .leading], 20)
                    Spacer()
                }
                AnnouncementCell()
                Spacer()
                TextField("공지사항 입력", text: $announcementText)
                    .padding(20)
                    .background(Color.myWhite)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.myPrimary, lineWidth: 1)
                    )
                    .padding(.horizontal)
            }
        }
        .background(Color.myBackground)
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
