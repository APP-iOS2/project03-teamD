//
//  MapSearch.swift
//  BinGongGan_User
//
//  Created by 윤지호 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore
import MapKit

struct MapSearchView: View {
    @StateObject var locationManager = LocationManager()
    
    @ScaledMetric(wrappedValue: 12, relativeTo: .caption) var paddingWidth
    @State private var categorys: [PlaceCategory] = [.share, .studio, .kitchen, .band]
    @State private var searchText: String = ""
    
    @Binding var tabBarVisivility: Visibility
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            MapViewCoordinater(locationManager: locationManager)
                .ignoresSafeArea(.all)
            
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Circle()
                            .fill(Color.myLightGray)
                            .frame(width: 45, height: 45)
                            .shadow(radius: 2, y: 1)
                            .overlay {
                                Image(systemName: "chevron.backward.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                            }
                        
                    }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: geometry.size.width / 1.4, height: 40)
                        .shadow(radius: 2, y: 1)
                        .overlay(alignment: .leading) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.myMediumGray)
                                    .padding(.leading)
                                TextField("주소 혹은 장소명을 검색해주세요", text: $searchText)
                                    .font(Font.body1Regular)
                                    .foregroundColor(.gray)
                                    .onSubmit {
                                        locationManager.isShowingList = true
                                    }
                            }
                        }
                        .padding()
                    
                    Spacer()
                }
                .padding([.top, .leading, .trailing])
                VStack(alignment: .leading) {
                    HStack {
                        ForEach(categorys, id: \.self) { category in
                            Button(category.rawValue) {
                                locationManager.didSelectCategory(category)
                            }
                            .padding([.trailing, .leading], paddingWidth)
                            .padding([.top, .bottom], 7)
                            .foregroundColor(locationManager.selectedCategoty == category ? .white : .myDarkGray)
                            .font(.captionRegular)
                            .background(locationManager.selectedCategoty == category ? Color.myMint : Color.white)
                            .cornerRadius(13)
                            .shadow(radius: 2, y: 1)
                        }
                        Spacer()
                    }
                }
                .padding(.leading)
            }
            
            Image("mungmoongE1")
                .resizable()
                .position(CGPoint(x: geometry.size.width / 2 + 7, y: locationManager.isChaging ? (geometry.size.height / 2 - 25) : (geometry.size.height / 2 - 20)))
                .frame(width: 80, height: 80, alignment: .center)
                
           
            if locationManager.isShowingList {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(locationManager.placeList) { place in
                            NavigationLink {
                                GongGanDetailView(placeId: place.id)
                            } label: {
                                SummaryPlaceView(place: place)
                                    .foregroundColor(.myDarkGray)
                            }
                        }
                        .padding(.leading, 25)
                    }
                    .padding(.trailing, 30)
                }
                .offset(CGSize(width: 0, height: geometry.size.height - 200))
            } else {
                HStack(alignment: .center) {
                    Button {
                        locationManager.moveFocusOnUserLocation()
                    } label: {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            .shadow(radius: 2, y: 1)
                            .overlay {
                                Image("SearchViewImage")
                                    .renderingMode(.template)
                                    .foregroundColor(.black)
                            }
                    }
                    Spacer()
                    Button {
                        locationManager.isShowingList = true
                    } label: {
                        Label("목록", systemImage: "list.dash")
                            .frame(width: 100, height: 40)
                            .background(Color.white)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                            .shadow(radius: 2, y: 1)
                    }
                    
                }
                .padding([.leading, .trailing], 25)
                .offset(CGSize(width: 0, height: geometry.size.height - 50))
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            tabBarVisivility = .hidden
            locationManager.fetchAnotations()
        }
        .onDisappear {
            tabBarVisivility = .visible
        }
    }
}

struct MapSearch_Previews: PreviewProvider {
    static var previews: some View {
        MapSearchView(tabBarVisivility: .constant(.hidden))
    }
}
