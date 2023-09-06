//
//  MapSearch.swift
//  BinGongGan_User
//
//  Created by 윤지호 on 2023/09/05.
//

import SwiftUI
import MapKit

struct MapSearchView: View {
    @StateObject var locationManager = LocationManager()
    
    @State var searchText: String = ""
    
    
    var body: some View {
        GeometryReader { geometry in
            MapViewCoordinater(locationManager: locationManager)
                .ignoresSafeArea(.all)
                
                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        print("hi")
                    } label: {
                        Image(systemName: "chevron.backward.circle.fill")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 4)
                    }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: geometry.size.width / 1.4, height: 40)
                        .shadow(radius: 4, y: 4)
                        .overlay(alignment: .leading) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .padding(.leading)
                                TextField("주소 혹은 장소명을 검색해주세요", text: $searchText)
                            }
                        }
                        .padding()
                        
                    Spacer()
                }
                .padding([.top, .leading, .trailing])
                
                HStack {
                    ForEach(0..<3, id: \.self) { idx in
                        Button("idx \(idx)") {

                        }
                    }
                }
                
           
            if locationManager.isShowingList {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<4, id: \.self) { _ in
                            SummaryPlaceView()
                        }
                        .padding([.leading], 30)
                    }
                }
                .offset(CGSize(width: 0, height: geometry.size.height - 200))
            } else {
                HStack(alignment: .center) {
                    Button {
                        locationManager.moveFocusOnUserLocation()
                    } label: {
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.brown)
                            .shadow(radius: 4, y: 4)
                    }
                    Spacer()
                    Button {
                        locationManager.isShowingList = true
                    } label: {
                        Label("목록", systemImage: "list.dash")
                            .frame(width: 100, height: 40)
                            .background(.brown)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 4)
                    }
                    
                }
                .padding([.leading, .trailing], 25)
                .offset(CGSize(width: 0, height: geometry.size.height - 90))
                
            }
        }
    }
}

struct MapSearch_Previews: PreviewProvider {
    static var previews: some View {
        MapSearchView()
    }
}
