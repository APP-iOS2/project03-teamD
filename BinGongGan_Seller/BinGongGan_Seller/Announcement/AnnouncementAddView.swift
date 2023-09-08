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
    @State private var selectedPlace: PlaceCategory = .쉐어오피스
    @State private var placeNameText: String = ""
    @State private var informationToPassText: String = ""
    @State private var placePriceText: String = ""
    @State private var placeAdress: String = ""
    @State private var placeInfomations = PlaceInfomationModel.data
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    private var placeInfomationString: [String] {
        placeInfomations.filter {
            $0.isSelected
        }.map {
            $0.name
        }
    }

    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            VStack{
                HStack{
                    Text("공지 등록")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.myPrimary)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Text("등록 취소")
                            .foregroundColor(Color.myPrimary)
                    }
                    .buttonStyle(.plain)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                }
                Form {
                    Section{
                        Text("공간 선택")
                        Picker("Place", selection: $selectedPlace) {
                            ForEach(PlaceCategory.allCases) { category in
                                Text(category.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .listRowSeparator(.hidden)

                    Section {
                        Text("공지사항 제목")
                        TextField("제목을 입력하세요", text: $placeNameText)
                            .textFieldStyle(TextFieldStyles())
                    }

                    Section {
                        Text("공지사항 입력")
                        TextEditor(text: $informationToPassText)
                            .frame(height: 150)
                            .background(Color.myLightGray)
                            .border(Color.myPrimary)


                    }

                    Section {
                        Text("공간 사진 등록")
                        PhotoSelectedView()
                        Button {
                            //Code
                        } label: {
                            Text("등록하기")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                                .bold()
                                .background(Color.myPrimary)
                                .cornerRadius(15)
                        }
                    }
                }//Form
                
            }
        }
    }
}

struct AnnouncementAddView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementAddView()
    }
}
