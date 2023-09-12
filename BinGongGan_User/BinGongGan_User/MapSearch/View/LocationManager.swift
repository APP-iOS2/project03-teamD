//
//  LocationManager.swift
//  BinGongGan_User
//
//  Created by 윤지호 on 2023/09/05.
//

import Foundation
import MapKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

// 작동 방식
// 1. 시작 시 자신의 gps위치로 고정 -> 자신 주변의 place들을 핀으로 찍음
// 2. 지도를 움직이면 gps가 업데이트 중단 -> 지도이동 후 이동이 멈추면 주변의 place를 검색 후 지도에 표시
// 3. 내위치 버튼을 누를 시 자신에게로 이동 + 지도 자신 주변으로 고정 + 주변 place

// 기능
// - 핀 터치 시 해당 place 정보 보여주기
// - 지도 이동 시 핀이 위로 떴다가 이동을 멈추면 가운데에 핀이 꽂힘

final class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var mapView: MKMapView = .init()
    
    @Published var selectedCategoty: String = ""
    @Published var isShowingList: Bool = false
    @Published var placeList: [SamplePlace] = []
    
    @Published var isChaging: Bool = false
    @Published var isFocusUser: Bool = true

        
    private var userLocalcity: String = ""
    private var searchResult: [SamplePlace] = []
    
    var filteredPlaces: [SamplePlace] {
        return searchResult.filter { place in
            let placetest = place.address.address.components(separatedBy: " ")
            
            let isEqualLocalcity = placetest.filter { $0 == userLocalcity }.count > 0
            let isEqualCategory = place.placeCategory == selectedCategoty
            
            
            return isEqualCategory && isEqualLocalcity
        }
    }
    
    
    override init() {
        super.init()
        configure()
        requestAuthorizqtion()
    }
    
    func configure() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestAuthorizqtion() {
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            moveFocusOnUserLocation()
        case .notDetermined:
            locationManager.startUpdatingLocation()
            locationManager.requestAlwaysAuthorization()
        default: break
        }
    }
    
}

extension LocationManager {
    func moveFocusOnUserLocation() {
        isFocusUser = true
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func moveFocusChange(location: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func convertCLLocationToAddress(location: CLLocation) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemark, error in
            if error != nil {
                return
            }
            
            guard let placemark = placemark?.first else { return }
            
            if self.userLocalcity != placemark.subLocality ?? "주소없음" {
                self.userLocalcity = placemark.subLocality ?? "주소없음"
                
                Task {
                    await self.fetchAnotations()
                }
            }
            print(self.userLocalcity)
            return
        }
    }
    
    func fetchAnotations() async {
        do {
            let snapshots = try await Firestore.firestore().collection("Place").getDocuments()
            
            var places: [SamplePlace] = []
            try snapshots.documents.forEach { snapshot in
                do {
                    let place = try snapshot.data(as: SamplePlace.self)
                    places.append(place)
                    
                }
            }
            print(places)
            searchResult = places
            placeList = filteredPlaces
            setAnnotations()
        } catch {
            print(error.localizedDescription)
        }

    }
    
    func setAnnotations() {
        var resultPlace: [SamplePlace] = []
        switch selectedCategoty {
        case "":
            resultPlace = searchResult
        default:
            resultPlace = searchResult.filter { $0.placeCategory == selectedCategoty }
        }
        
        for place in resultPlace {
            let annotation = MKPointAnnotation()
            annotation.title = place.placeName
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.address.latitude, longitude: place.address.longitude)
            mapView.addAnnotation(annotation)
        }
    }
    
    func didSelectCategory(_ category: String) {
        if selectedCategoty == category {
            selectedCategoty = ""
        } else {
            selectedCategoty = category
            setAnnotations()
        }
    }
    
    func selectAnnotation() {
        
    }
    
}



extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways else { return }
        locationManager.requestLocation()
        moveFocusOnUserLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("비상비상 에러에러 \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if isFocusUser {
            locationManager.stopUpdatingLocation()
            locations.last.map { location in
                DispatchQueue.main.async {
//                    self.region = MKCoordinateRegion(
//                        center: location.coordinate,
//                        span: .init(latitudeDelta: 0.5, longitudeDelta: 0.5)
//                    )
                }
            }
        }
    }
    
}


extension LocationManager: MKMapViewDelegate {
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        
        DispatchQueue.main.async {
            self.isShowingList = false
            self.isFocusUser = false
            self.isChaging = true
        }
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location: CLLocation = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        
        self.convertCLLocationToAddress(location: location)

        DispatchQueue.main.async {
            self.isChaging = false
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
//        if l
    }
    
}


struct SamplePlace:Identifiable, Codable {
    public var id: String = UUID().uuidString //id
    public var placeName: String //이름
    public var placePrice: String //가격
    public var placeCategory: String //카테고리
    public var placeImageStringList: [String] // 이미지 링크
    public var note: String //이용시 주의 사항
    public var placeInfomationList: [String] //공간 정보
    public var address: Address //주소
    
    public init(placeName: String, placePrice: String, placeCategory: String, placeImageStringList: [String], note: String, placeInfomationList: [String], address: Address) {
        self.placeName = placeName
        self.placePrice = placePrice
        self.placeCategory = placeCategory
        self.placeImageStringList = placeImageStringList
        self.note = note
        self.placeInfomationList = placeInfomationList
        self.address = address
    }
    
//    static let myRegion = Sam
    
    static let sample = SamplePlace(placeName: "돌초밥", placePrice: "1000", placeCategory: "공유오피스", placeImageStringList: [], note: "", placeInfomationList: [], address: Address(address: "봉천동", placeName: "돌초밥", x: "126.964", y: "37.4774"))
    
    static let sample2 = SamplePlace(placeName: "공차", placePrice: "11000", placeCategory: "스튜디오", placeImageStringList: [], note: "", placeInfomationList: [], address: Address(address: "사당동", placeName: "공차", x: "126.9615", y: "37.4781"))
    
    
}

public struct Address: Codable, Identifiable {
    public var id: UUID = UUID()
    public var address: String
    public var placeName: String
    public var x:String
    public var y:String
    public var longitude: Double {
        return Double(x) ?? 0
    }
    public var latitude: Double {
        return Double(y) ?? 0
    }
    
    public enum CodingKeys: String, CodingKey {
        case address = "address_name"
        case placeName = "place_name"
        case x = "x"
        case y = "y"
    }
    
    public init(address: String, placeName: String, x: String, y: String) {
        self.address = address
        self.placeName = placeName
        self.x = x
        self.y = y
    }
}
