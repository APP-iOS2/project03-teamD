//
//  EventView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/07.
//

import SwiftUI

struct EventView: View {
    @Environment(\.dismiss) private var dismiss

    @State var isShowingEventAddSheet: Bool = false

    var body: some View {
        VStack{
            HStack {
                Text("이벤트 관리")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.myBrown)
                    .padding(.leading, 20)
                Spacer()
            }

//            Form {
//                Section {
//                    ForEach(0..<5) { _ in
//                        AnnouncementTextRow()
//                            .background(Color.clear)
//                    }
//                } header: {
//                    Text("공간1")
//                        .foregroundColor(Color.myBrown)
//                }
//
//                Section {
//                    ForEach(0..<5) { _ in
//                        AnnouncementTextRow()
//                            .background(Color.clear)
//                    }
//                } header: {
//                    Text("공간2")
//                        .foregroundColor(Color.myBrown)
//                }
//
//                Section {
//                    ForEach(0..<5) { _ in
//                        AnnouncementTextRow()
//                            .background(Color.clear)
//                    }
//                } header: {
//                    Text("공간3")
//                        .foregroundColor(Color.myBrown)
//                }
//            }
//            .background(Color.myBackground)
        }
        .background(Color.myBackground)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .customBackbutton()
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
