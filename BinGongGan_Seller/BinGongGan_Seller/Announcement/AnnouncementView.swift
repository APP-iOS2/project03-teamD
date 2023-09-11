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
        VStack{
            HStack {
                Text("공지 관리")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color.myBrown)
                    .padding(.leading, 20)
                Spacer()
                NavigationLink {
                    AnnouncementAddView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color.myBrown)
                        .padding(.trailing, 20)
                }
            }
            Form {
                Section(header: Text("공간1")
                    .foregroundColor(Color.myBrown)
                ) {
                    ForEach(0..<5) { _ in
                        NavigationLink {
                            AnnouncementDetailView()
                        } label: {
                            AnnouncementTextRow()
                                .background(Color.clear)
                        }
                    }
                }
                Section(header: Text("공간2")
                    .foregroundColor(Color.myBrown)) {
                        ForEach(0..<5) { _ in
                            NavigationLink {
                                AnnouncementDetailView()
                            } label: {
                                AnnouncementTextRow()
                                    .background(Color.clear)
                            }
                        }
                    }
                Section(header: Text("공간3")
                    .foregroundColor(Color.myBrown)) {
                        ForEach(0..<5) { _ in
                            NavigationLink {
                                AnnouncementDetailView()
                            } label: {
                                AnnouncementTextRow()
                                    .background(Color.clear)
                            }
                        }
                    }
            }
        }
        .background(Color.myBackground)
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .customBackbutton()
    }
    
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
