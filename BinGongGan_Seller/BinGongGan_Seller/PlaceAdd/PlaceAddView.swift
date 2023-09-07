//  PlaceAddView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/05.
//
/* TODO: -
 카테고리 피커 []
 주소 검색 완성 []
 맵뷰 핀 찍기 []
 사진 등록 뷰 []
 전달 정보 메시지 전송[]
 */
import SwiftUI
import MapKit
import BinGongGanCore

struct PlaceAddView: View {
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
        Form {
            Section {
                Text("공간 이름")
                TextField("공간 이름을 입력하세요", text: $placeNameText)
                    .textFieldStyle(TextFieldStyles())
            }
            
            Section{
                Text("공간 카테고리")
                Picker("Place", selection: $selectedPlace) {
                    ForEach(PlaceCategory.allCases) { category in
                        Text(category.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .listRowSeparator(.hidden)
            
            Section {
                Text("공간 주소")
                PlaceMapView(address: placeNameText)
            }
            .listRowSeparator(.hidden)
            
            Section {
                Text("공간 대여 가격")
                TextField("공간 이름을 입력하세요", text: $placePriceText)
                    .textFieldStyle(TextFieldStyles())
            }
            
            Section {
                Text("공간 사진 등록")
                PhotoSelectedView()
            }
            
            Section {
                Text("공간 정보 선택")
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach($placeInfomations) { $infomation in
                        PlaceInfomationButtonView(infomation: $infomation)
                    }
                }
                .padding()
                .background(Color.myLightGray)
                .cornerRadius(15)
                .frame(maxHeight: .infinity)
            }
            
            Section {
                Text("예약 확정시 전달할 정보")
                TextEditor(text: $informationToPassText)
                    .frame(height: 150)
                    .background(Color.myLightGray)
                    .border(Color.myPrimary)
                
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
        ZStack {
            Rectangle()
                .foregroundColor(Color.myLightGray)
                .cornerRadius(12)
                .frame(height: 46)
            // 텍스트필드
            configuration
                .font(.system(size: 13))
                .foregroundColor(.black)
                .padding()
        }
    }
}
