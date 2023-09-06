//
//  MapViewCoordinater.swift
//  BinGongGan_User
//
//  Created by 윤지호 on 2023/09/05.
//

import Foundation
import SwiftUI
import MapKit

struct MapViewCoordinater: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager
    
    func makeUIView(context: Context) -> some UIView {
        return locationManager.mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
}
