//
//  AnnouncementView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/06.
//
import SwiftUI
import BinGongGanCore

struct AnnouncementView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        //영석님 이거를 왜쓰셨을까용~? ㅎㅎ어차피 네비게이션인뎅~
        //이거 지우고 정렬 다시 해주세요 ^^
//        NavigationView{
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
                            .foregroundColor(.myPrimary)
                    }
                }
            }
//        }
    }
    
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
