//
//  MapTest.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/05.
//
import SwiftUI
import MapKit
import BinGongGanCore

struct PlaceMapView: View {
    @State var address: String
    @State private var coordinates = CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914)
    @State private var addressSuggestions: [String] = []
    var body: some View {
        VStack{
      
                TextField("공간 주소를 입력하세요", text: $address)
                    .textFieldStyle(TextFieldStyles())
                    .overlay(alignment: .trailing) {
                        Button {
                            searchAddress()
                            updateAddressSuggestions()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 15)
                    }
                
              
     
            
            List(addressSuggestions, id: \.self) { suggestion in
                Button {
                    address = suggestion
                    searchAddress()
                } label: {
                    Text(suggestion)
                }
            }

            MapView(coordinates: coordinates)
                .frame(height: 300)
                .cornerRadius(10)
        }
        .onChange(of: address) { newValue in
            // 사용자 입력이 변경될 때마다 주소 제안 리스트 업데이트
            updateAddressSuggestions()
        }
    }
    
    func searchAddress() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location?.coordinate {
                coordinates = location
            } else {
                // 에러 처리
                print("주소를 찾을 수 없습니다.")
            }
        }
    }
    
    func updateAddressSuggestions() {
        let geocoder = CLGeocoder()
        
        // 사용자 입력을 기반으로 주소 검색
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard error == nil else {
                print("Geocoding 에러: \(error!.localizedDescription)")
                return
            }
            
            guard let placemarks = placemarks else {
                return
            }
            
            // 검색된 주소에서 주소 문자열을 추출하여 주소 제안 리스트 업데이트
            let suggestions = placemarks.compactMap { placemark in
                var suggestion = ""
                if let name = placemark.name {
                    suggestion += name
                }
                //
                return suggestion
            }
            
            // 업데이트된 주소 제안 리스트를 SwiftUI에 적용
            addressSuggestions = suggestions
        }
    }
}


struct MapView: UIViewRepresentable {
    var coordinates: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(
            center: coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        uiView.setRegion(region, animated: true)
    }
}

struct MapTest_Previews: PreviewProvider {
    static var previews: some View {
        PlaceMapView(address: "Seoul")
    }
}
