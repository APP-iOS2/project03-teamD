//
//  EventView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/07.
//

import SwiftUI

struct EventView: View {
    @Environment(\.dismiss) private var dismiss
    
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
            Form {
                Section(header: Text("공간1")
                    .foregroundColor(Color.myBrown)
                ) {
                    ForEach(0..<5) { _ in
                        AnnouncementTextRow()
                            .background(Color.clear)
                    }
                }
                Section(header: Text("공간2")
                    .foregroundColor(Color.myBrown)) {
                        ForEach(0..<5) { _ in
                            AnnouncementTextRow()
                                .background(Color.clear)
                        }
                    }
                Section(header: Text("공간3")
                    .foregroundColor(Color.myBrown)) {
                        ForEach(0..<5) { _ in
                            AnnouncementTextRow()
                                .background(Color.clear)
                        }
                    }
            }
        }
        .background(Color.myBackground)
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myBrown)
                }
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
