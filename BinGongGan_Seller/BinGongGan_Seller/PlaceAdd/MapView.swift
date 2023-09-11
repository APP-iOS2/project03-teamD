//
//  MapView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//
import SwiftUI
import MapKit

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
