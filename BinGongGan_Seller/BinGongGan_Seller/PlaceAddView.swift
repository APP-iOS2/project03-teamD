//
//  PlaceAddView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/05.
//

import SwiftUI
import MapKit

struct PlaceAddView: View {
    @State var placeNameText: String = ""
    @State var informationToPassText: String = ""
    @State var placePriceText: String = ""
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text("공간 이름")
                    TextField("공간 이름을 입력하세요", text: $placeNameText)
                        .textFieldStyle(TextFieldStyles())
                    
                    Text("공간 카테고리")
                    TextField("공간 이름을 입력하세요", text: $placeNameText)
                        .textFieldStyle(TextFieldStyles())
                }
                
                Group {
                    Text("공간 주소")
                    ZStack(alignment: .trailing) {
                        TextField("공간 이름을 입력하세요", text: $placeNameText)
                            .textFieldStyle(TextFieldStyles())
                        Button {
                            //Code
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                        }
                        .padding(5)
                        .background(.gray)
                    }
                    Map(coordinateRegion: $region)
                        .frame(height: 200)
                    
                    Text("공간 대여 가격")
                    TextField("공간 이름을 입력하세요", text: $placeNameText)
                        .textFieldStyle(TextFieldStyles())
                    
                    Text("공간 사진 등록")
                    PlacePhotoView()
                    
                    Text("공간 정보")
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 150)
                }
                
                Group {
                    Text("예약 확정시 전달할 정보")
                    TextEditor(text: $informationToPassText)
                        .frame(height: 150)
                        .background(.gray)
                }
                
                Button {
                    //Code
                } label: {
                    Text("등록하기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .bold()
                        .background(.yellow)
                        .cornerRadius(15)
                }
            }
        }
        .padding(20)
        .navigationTitle("내 공간 등록")
    }
}

struct TextFieldStyles: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray)
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

struct PlacePhotoView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(1...4, id:\.self) { i in
                    Button  {
                        //Code
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(.gray)
                                .frame(width: 150, height: 150)
                            if i == 1 {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                }
            }//공간사진 HStack
        }
    }
}

struct PlaceAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlaceAddView()
        }
    }
}
