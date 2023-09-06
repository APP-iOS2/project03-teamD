//
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

struct PlaceAddView: View {
    enum Place: String, CaseIterable, Identifiable {
        case 쉐어오피스, 밴드룸, 스튜디오, 키친룸
        var id: Self { self }
    }

    @State private var selectedPlace: Place = .쉐어오피스
    @State var placeNameText: String = ""
    @State var informationToPassText: String = ""
    @State var placePriceText: String = ""
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    @State var placeInfomations = PlaceInfomationModel.data
    
    var selectedInfomations:[String] {
        placeInfomations.filter {
            $0.isSelected
        }.map {
            $0.name
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text("공간 이름")
                    TextField("공간 이름을 입력하세요", text: $placeNameText)
                        .textFieldStyle(TextFieldStyles())
                    
                    Text("공간 카테고리")
                    Picker("Place", selection: $selectedPlace) {
                        Text("쉐어오피스").tag(Place.쉐어오피스)
                        Text("밴드룸").tag(Place.밴드룸)
                        Text("스튜디오").tag(Place.스튜디오)
                        Text("키친룸").tag(Place.키친룸)
                    }.pickerStyle(.segmented)
                }
                
                Group {
                    Text("공간 주소")
                    PlaceMapView(address: placeNameText)

                    Text("공간 대여 가격")
                    TextField("공간 이름을 입력하세요", text: $placeNameText)
                        .textFieldStyle(TextFieldStyles())
                    
                    Text("공간 사진 등록")
                    PhotoSelectedView()
                    
                    Text("공간 정보")
                    
                    
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach($placeInfomations) { $infomation in
                            PlaceInfomationButtonView(buttonName: infomation.name, buttonImageString: infomation.image, isClicked: infomation.isSelected)
                            
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    .frame(maxHeight: .infinity)
                    
                }
                
                Group {
                    Text("예약 확정시 전달할 정보")
                    TextEditor(text: $informationToPassText)
                        .frame(height: 150)
                        .background(.gray)
                        .buttonBorderShape(.roundedRectangle)
                        .border(Color.secondary)
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

struct PlaceInfomationModel: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var isSelected: Bool
    
    static let data = [
        PlaceInfomationModel(name: "와이파이", image: "wifi", isSelected: false),
        PlaceInfomationModel(name: "주차장", image: "parkingsign", isSelected: false),
        PlaceInfomationModel(name: "반려동물", image: "pawprint.fill", isSelected: false),
        PlaceInfomationModel(name: "냉난방시설", image: "air.conditioner.horizontal", isSelected: false),
        PlaceInfomationModel(name: "화재경보기", image: "flame.fill", isSelected: false),
        PlaceInfomationModel(name: "소화기", image: "person", isSelected: false),
        PlaceInfomationModel(name: "엘리베이터", image: "door.sliding.left.hand.closed", isSelected: false),
        PlaceInfomationModel(name: "흡연실", image: "smoke", isSelected: false),
    ]
}


