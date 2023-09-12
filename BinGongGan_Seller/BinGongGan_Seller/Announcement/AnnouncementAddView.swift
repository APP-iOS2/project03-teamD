//
//  AnnouncementAddView.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementAddView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var announcementTitle: String = ""
    @State private var announcementContent: String = ""
    @State private var isSelectedAllPlace: Bool = false
    @State private var selectedPlace: String = ""
    @State private var placeNameText: String = ""
    @State private var informationToPassText: String = ""
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            ScrollView{
                HStack{
                    Text("공간 선택")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color.black)
                    Spacer()
                }
                .padding(.top, 10)
                
                HStack{
                    Picker("공간 선택", selection: $selectedPlace) {
                        ForEach(0..<3) { _ in
                            Text("picker1")
                        }
                    }
                    .accentColor(Color.myBrown)
                    .padding(.leading, -10)
                    .disabled(isSelectedAllPlace)
                    
                    Spacer()
                    Button {
                        isSelectedAllPlace.toggle()
                    } label: {
                        Text("전체 공간 선택")
                        Image(systemName: isSelectedAllPlace ? "checkmark.square" : "square")
                    }
                    .buttonStyle(.plain)
                }
                .padding(.bottom, 10)
                
                
                Group {
                    HStack{
                        Text("공지사항 제목")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    CustomTextField(maxLength: 20, placeholder: "공지 제목을 입력하세요", text: $announcementTitle)
                        .padding(.bottom, 10)
                }
                
                Group {
                    HStack{
                        Text("공지사항 입력")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    CustomTextEditor(maxLength: 400, text: $announcementContent)
                }
            }
            .padding(.horizontal, 20)
            
            VStack{
                Spacer()
                Button {
                    //action
                } label: {
                    Text("등록하기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .bold()
                        .background(Color.myBrown)
                        .cornerRadius(15)
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("공간 공지 등록")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .scrollContentBackground(.hidden)
            .customBackbutton()
        }
    }
}



struct AnnouncementAddView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementAddView()
    }
}
