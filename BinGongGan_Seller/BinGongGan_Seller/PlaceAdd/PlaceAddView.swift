//  PlaceAddView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/05.
//

import SwiftUI
import MapKit
import BinGongGanCore
import Combine
import FirebaseFirestore

struct PlaceAddView: View {
    @EnvironmentObject var placeStore: PlaceStore
    @State private var selectedPlace: PlaceCategory = .Share
    @State private var placeNameText: String = ""
    @State private var noteText: String = ""
    @State private var placePriceText: String = ""
    @State private var placeAdress: String = ""
    @State private var placeInfomations = PlaceInfomationModel.data
    @State var address: Address?
    @State var selectedImage: [UIImage] = []
    @State var selectedImageNames: [String] = []
    // @State var address: String = ""
    @State var isShwoingSearchSheet: Bool = false
    @State private var coordinates = CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914)
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
                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
                    if address == nil {
                        Button {
                            isShwoingSearchSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text("주소검색")
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.blue)
                            .border(Color.myLightGray, width: 2)
                            .cornerRadius(5)
                        }
                        
                    } else {
                        VStack(alignment: .leading) {
                            Text("\(address?.placeName ?? "상호명")")
                            Text("\(address?.address ?? "주소입니다")")
                        }
                        Button {
                            isShwoingSearchSheet = true
                        } label: {
                            Text("주소검색")
                            
                                .frame(maxWidth: .infinity)
                                .background(.gray)
                                .foregroundColor(.blue)
                                .cornerRadius(5)
                            
                        }
                        
                        MapView(coordinates: coordinates)
                            .frame(height: 300)
                            .cornerRadius(10)
                    }
                }
                
                Section {
                    Text("공간 대여 가격")
                    TextField("가격을 입력하세요", text: $placePriceText)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
                    PhotoSelectedView(selectedImages: $selectedImage,selectedImageNames: $selectedImageNames)
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
                    Text("공간 정보")
                    TextEditor(text: $noteText)
                        .frame(height: 150)
                        .background(Color.myLightGray)
                        .border(Color.myPrimary)
                    
                    Button {
                        if let address {
                            let place = Place(
                                sellerId: "판매자",
                                placeName: placeNameText,
                                placePrice: placePriceText,
                                placeCategory: selectedPlace,
                                placeImageStringList: selectedImageNames,
                                note: noteText,
                                placeInfomationList: placeInfomationString,
                                address: address
                            )
                            placeStore.addPlace(place: place)
                            
                        }
                        
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
        .sheet(isPresented: $isShwoingSearchSheet, onDismiss: {
            if let address {
                coordinates =  CLLocationCoordinate2D(latitude: address.latitudeDouble, longitude: address.longitudeDouble)
            }
        }, content: {
            AddressSearchView(isShwoingSearchSheet: $isShwoingSearchSheet) { newAdress in
                address = newAdress
            }
            
        })
        .customBackbutton()
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
                .environmentObject(PlaceStore())
        }
    }
}
