//
//  AnnouncementView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Text("공지 관리")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.myPrimary)
                        .padding(.leading, 20)
                    Spacer()
                }
                Form {
                    Section(header: Text("공간1")
                        .foregroundColor(Color.myPrimary)
                    ) {
                        ForEach(0..<5) { _ in
                            AnnouncementTextRow()
                                .background(Color.clear)
                        }
                    }
                    Section(header: Text("공간2")
                        .foregroundColor(Color.myPrimary)) {
                            ForEach(0..<5) { _ in
                                AnnouncementTextRow()
                                    .background(Color.clear)
                            }
                        }
                    Section(header: Text("공간3")
                        .foregroundColor(Color.myPrimary)) {
                            ForEach(0..<5) { _ in
                                AnnouncementTextRow()
                                    .background(Color.clear)
                            }
                        }
                }
            }
            .background(Color.myBackground)
        }
    }
    
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
