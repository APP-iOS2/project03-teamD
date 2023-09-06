//
//  AnnouncementView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//

import SwiftUI

struct AnnouncementView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Text("공지사항")
                        .font(.title)
                        .bold()
                        .padding([.top, .leading], 20)
                    Spacer()
                }
            }
        }
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
