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
    @State var isPresentedAddView: Bool = false
    
    var body: some View {
        VStack{
            HStack {
                Text("공지 관리")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.myPrimary)
                    .padding(.leading, 20)
                Spacer()
                Button( action: {
                    isPresentedAddView.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .padding(.trailing, 20)
                })
                .buttonStyle(.plain)
                .sheet(isPresented: $isPresentedAddView) {
                    AnnouncementAddView()
                        .presentationDetents([.large])
                        .cornerRadius(15)
                }
            }
            Form {
                Section(header: Text("공간1")
                    .foregroundColor(Color.myPrimary)) {
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
                    .foregroundColor(Color.myPrimary)) {
                        ForEach(0..<5) { _ in
                            NavigationLink {
                                AnnouncementDetailView()
                            } label: {
                                AnnouncementTextRow()
                                    .background(Color.clear)
                            }
                        }
                        AnnouncementTextRow()
                            .background(Color.clear)
                    }
                Section(header: Text("공간3")
                    .foregroundColor(Color.myPrimary)) {
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
            .background(Color.myBackground)
            .navigationBarBackButtonHidden(true)
            .scrollContentBackground(.hidden)
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
    }
}
struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
