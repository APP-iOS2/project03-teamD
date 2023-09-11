//
//  PlaceListFilterView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/11.
//

import SwiftUI

struct PlaceListFilterView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    @Binding var isShowingFilterSheet: Bool
    
    @State var filteredCity: City = City(name: "고르는중", subCity: SubCity(name: [""]))
    /// 서울특별시 등 (나중에 해야함)
    @State var selectCity: String = ""
    @Binding var selectSub: [String]
    @Binding var category: String
    
    
    var body: some View {
        VStack {
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(selectSub, id: \.self) { sub in
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: HomeNameSpace.screenHeight * 0.15, height: HomeNameSpace.screenHeight * 0.07)
                                .foregroundColor(.myBackground)
                                .overlay {
                                    Text("\(sub)")
                                    
                                }
                        }
                    }// HSTACK
                }// SCROLLVIEW
                .frame(height: HomeNameSpace.screenHeight * 0.1)
                
                Button {
                    homeStore.filteredPlaceList(category: category, cities: selectSub)
                    isShowingFilterSheet = false
                } label: {
                    Text("찾기")
                }
            }// HSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
            HStack {
               
                    List {
                        ForEach(homeStore.cities) { city in
                            Button {
                                filteredCity = city
                                selectCity = city.name
                                selectSub.removeAll()
                            } label: {
                                Text("\(city.name)")

                                    .foregroundColor(city.name == selectCity ? . myBlack : .myDarkGray)

                                    .font(city.name == selectCity ? .body1Bold : .body1Regular)
                                    
                            }.listRowBackground(Color.myBackground)
                               
                        }
                    }
                    .listStyle(.plain)
                    
                PlaceListSubFilterView(selectedCity: $filteredCity, selectSub: $selectSub)
            }// HSTACK
            
        }// VSTACK
        .presentationDetents(
            [.large,.large])
        .presentationDragIndicator(
            .visible)
    }
}
struct PlaceListSubFilterView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    @Binding var selectedCity: City
    @Binding var selectSub: [String]
    @State var isPressed: Bool = false
    
    var body: some View {
        List {
            ForEach(selectedCity.subCity.name, id: \.self) { sub in
                Button {
                    if !selectSub.contains(sub){
                        selectSub.append(sub)
                    }
                } label: {
                    Text("\(sub)")
                        .foregroundColor(selectSub.contains(sub) ? .black : .myLightGray)
                        .font(selectSub.contains(sub) ? .body1Bold : .body1Regular)
                }
            }
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
        
    }
}

struct PlaceListFilterView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListFilterView(isShowingFilterSheet: .constant(true), selectSub: .constant([""]), category: .constant("공유주방"))
            .environmentObject(HomeStore())
    }
}
