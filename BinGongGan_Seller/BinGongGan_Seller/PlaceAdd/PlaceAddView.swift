//  PlaceAddView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/05.
//

import SwiftUI
import MapKit
import BinGongGanCore
import Combine

struct PlaceAddView: View {
    @State private var selectedPlace: PlaceCategory = .Share
    @State private var placeNameText: String = ""
    @State private var informationToPassText: String = ""
    @State private var placePriceText: String = ""
    @State private var placeAdress: String = ""
    @State private var placeInfomations = PlaceInfomationModel.data
    @State var selectedImage: [UIImage] = []
    @State var address: String = ""
    @State var isShwoingSearchSheet: Bool = false
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    private var placeInfomationString: [String] {
        placeInfomations.filter {
            $0.isSelected
        }.map {
            $0.name
        }
    }
    
    var body: some View {
        List {
            Group {
                Section {
                    Text("공간 이름")
                    TextField("공간 이름을 입력하세요", text: $placeNameText)
                        .textFieldStyle(TextFieldStyles())
                }
                
                Section{
                    Text("공간 카테고리")
                    Picker("공간 카테고리", selection: $selectedPlace) {
                        ForEach(PlaceCategory.allCases) { category in
                            Text(category.rawValue)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .labelsHidden()
                    .tint(.black)
                }
                
                Section {
                    Text("공간 주소")
                    TextField("공간 주소를 입력하세요", text: $address)
                        .textFieldStyle(TextFieldStyles())
                        .overlay(alignment: .trailing) {
                            Button {
                                isShwoingSearchSheet = true
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing, 15)
                        }
                        
                   // PlaceMapView(address: placeNameText)
                }
                
                Section {
                    Text("공간 대여 가격")
                    TextField("가격을 입력하세요", text: $placePriceText)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(TextFieldStyles())
                        .onReceive(Just(placePriceText)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.placePriceText = filtered
                            }
                        }
                        .overlay(alignment:.trailing) {
                            Text("￦")
                                .padding(.trailing, 1)
                        }
                }
                
                Section {
                    Text("공간 사진 등록")
                    PhotoSelectedView(selectedImages: $selectedImage)
                }
                
                Section {
                    Text("공간 정보 선택")
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach($placeInfomations) { $infomation in
                            PlaceInfomationButtonView(infomation: $infomation)
                        }
                    }
                    .padding()
                    .background(Color.myBackground)
                    .cornerRadius(15)
                    .frame(maxHeight: .infinity)
                }
                
                Section {
                    Text("공간 이용시 주의사항")
                    TextEditor(text: $informationToPassText)
                        .frame(height: 150)
                        .background(Color.myLightGray)
                        .border(Color.myPrimary)
                    
                    Button {
                        let place = PlaceModel(
                            placeName: placeNameText,
                            placePrice: placePriceText,
                            placeCategory: selectedPlace.rawValue,
                            placeAdress: placeAdress,
                            placeImageStringList: ["nil"],
                            informationToPass: informationToPassText,
                            placeInfomationList: placeInfomationString
                        )
                        print(place)
                    } label: {
                        Text("등록하기")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .bold()
                            .background(Color.myPrimary)
                            .cornerRadius(15)
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
        .sheet(isPresented: $isShwoingSearchSheet) {
            AddressSearchView(searchText: $address, isShwoingSearchSheet: $isShwoingSearchSheet)
        }
        .padding(10)
        .listStyle(.plain)
        //Form
        .navigationTitle("내 공간 등록")
    }
}

struct PlaceAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlaceAddView()
        }
    }
}

struct TextFieldStyles: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        // 텍스트필드
        configuration
            .textFieldStyle(.roundedBorder)
            .font(.system(size: 13))
            .foregroundColor(.black)
    }
}
