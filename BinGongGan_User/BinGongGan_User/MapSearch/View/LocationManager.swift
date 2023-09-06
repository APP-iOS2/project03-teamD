//
//  LocationManager.swift
//  BinGongGan_User
//
//  Created by 윤지호 on 2023/09/05.
//

import Foundation
import MapKit

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
    
    @Published var region = MKCoordinateRegion(
        center: .init(latitude: 37.334_900 , longitude: -122.009_020),
        span: .init(latitudeDelta: 0.5 , longitudeDelta: 0.5)
    )
    
    @Published var isShowingList: Bool = false
    @Published var isChaging: Bool = false
    @Published var isFocusUser: Bool = true
    
    private var nowUserPoint: CLLocationCoordinate2D?
    
    
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
            mapView.showsUserLocation = true
        case .notDetermined:
            locationManager.startUpdatingLocation()
            locationManager.requestAlwaysAuthorization()
        default: break
        }
    }
    
    func moveFocusOnUserLocation() {
        isFocusUser = true
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func moveFocusChange() {
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        
        let region = MKCoordinateRegion(center: nowUserPoint ?? .init(latitude: 37.334_900 , longitude: -122.009_020), span: span)
        mapView.setRegion(region, animated: true)
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
                    self.region = MKCoordinateRegion(
                        center: location.coordinate,
                        span: .init(latitudeDelta: 0.5, longitudeDelta: 0.5)
                    )
                }
            }
        }
    }
    
    func convertCLLocationToAddress(location: CLLocation) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemark, error in
            if error != nil {
                return
            }
            
            guard let placemark = placemark?.first else { return }
            print("\(placemark.country ?? "") / \(placemark.locality ?? "") / \(placemark.name ?? "")")
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
}
