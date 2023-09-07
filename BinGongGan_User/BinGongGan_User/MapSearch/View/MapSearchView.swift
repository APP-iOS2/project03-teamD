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
    @State private var categorys: [CategoryCase] = [.shareOffice, .studio, .shareKitchen, .bandRoom]
    @State private var searchText: String = ""
    @State private var selectedCategoty = ""
    
    @Binding var tabBarVisivility: Visibility
    
    var body: some View {
        GeometryReader { geometry in
            MapViewCoordinater(locationManager: locationManager)
                .ignoresSafeArea(.all)
            
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        
                    } label: {
                        Circle()
                            .fill(Color.myLightGray)
                            .frame(width: 45, height: 45)
                            .shadow(radius: 4, y: 4)
                            .overlay {
                                Image(systemName: "chevron.backward.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                            }
                        
                    }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: geometry.size.width / 1.4, height: 40)
                        .shadow(radius: 4, y: 4)
                        .overlay(alignment: .leading) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.myDarkGray)
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
                                selectedCategoty = category.rawValue
                            }
                            .padding([.trailing, .leading], paddingWidth)
                            .padding([.top, .bottom], 7)
                            .foregroundColor(selectedCategoty == category.rawValue ? .white : .myDarkGray)
                            .font(.captionRegular)
                            .background {
                                RoundedRectangle(cornerRadius: 13)
                                    .strokeBorder(selectedCategoty == category.rawValue ? Color.white : Color.myDarkGray, lineWidth: 0.5)
                                    .background(selectedCategoty == category.rawValue ? Color.mySecondary : Color.white)
                            }
                            .cornerRadius(13)
                            .shadow(radius: 4, y: 2)
                        }
                        Spacer()
                    }
                }
                .padding(.leading)
            }
           
            if locationManager.isShowingList {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<4, id: \.self) { idx in
                            NavigationLink {
                                GongGanDetailView()
                            } label: {
                                SummaryPlaceView()
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
                            .shadow(radius: 4, y: 4)
                            .overlay {
                                Image(systemName: "paperplane.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.mySecondary)
                            }

                    }
                    Spacer()
                    Button {
                        locationManager.isShowingList = true
                    } label: {
                        Label("목록", systemImage: "list.dash")
                            .frame(width: 100, height: 40)
                            .background(Color.mySecondary)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 4)
                    }
                    
                }
                .padding([.leading, .trailing], 25)
                .offset(CGSize(width: 0, height: geometry.size.height - 50))
            }
        }
        .onAppear {
            tabBarVisivility = .hidden
        }
        .onDisappear {
            tabBarVisivility = .visible
        }
    }
}

struct MapSearch_Previews: PreviewProvider {
    static var previews: some View {
        MapSearchView( tabBarVisivility: .constant(.hidden))
    }
}
