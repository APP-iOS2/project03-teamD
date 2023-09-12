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
    
    @State var filteredCity: City = City(name: "이거어캐없앨까", subCity: SubCity(name: [""]))
    /// 서울특별시 등 (나중에 해야함)
    @State var selectCity: String = ""
    
    
    var body: some View {
        
            VStack {
                HStack {
                    Button {
                        isShowingFilterSheet = false
                    } label: {
                        Text("취소")
                            .font(.body1Bold)
                            .foregroundColor(.myPrimary)
                    }
                    Spacer()
                    Button {
                        isShowingFilterSheet = false
                    } label: {
                        Text("찾기")
                            .font(.body1Bold)
                            .foregroundColor(.myPrimary)
                    }
                }// HSTACK
                .padding(.horizontal, 20)
                .padding(.top, 20)
                if !homeStore.selectSub.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(homeStore.selectSub, id: \.self) { sub in
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(width: HomeNameSpace.screenHeight * 0.15, height: HomeNameSpace.screenHeight * 0.07)
                                    .foregroundColor(.myWhite)
                                    .shadow(radius: 2, y: 1)
                                    .overlay {
                                        Text("\(sub)")
                                            .foregroundColor(.myDarkGray)
                                            .font(.captionRegular)
                                    }
                            }
                        }// HSTACK
                        .padding()
                    }// SCROLLVIEW
                    .frame(height: HomeNameSpace.screenHeight * 0.1)
                }
                HStack {
                    List {
                        ForEach(homeStore.cities) { city in
                            Button {
                                filteredCity = city
                                selectCity = city.name
                                homeStore.selectSub.removeAll()
                            } label: {
                                Text("\(city.name)")

                                    .foregroundColor(city.name == selectCity ? . myBlack : .myDarkGray)

                                    .font(city.name == selectCity ? .body1Bold : .body1Regular)
                                
                            }
                            .listRowBackground(Color.myBackground)
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                    PlaceListSubFilterView(selectedCity: $filteredCity)
                }// HSTACK
                
               
            }// VSTACK
            .presentationDetents(
                [.medium,.medium])
            .presentationDragIndicator(
            .visible)
            // 크게 작게
        //
    }
}
struct PlaceListSubFilterView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    @Binding var selectedCity: City
    @State var isPressed: Bool = false
    
    var body: some View {
        List {
            ForEach(selectedCity.subCity.name, id: \.self) { sub in
                Button {
                    if !homeStore.selectSub.contains(sub){
                        homeStore.selectSub.append(sub)
                        print("\(homeStore.selectSub)")
                    }
                } label: {
                    Text("\(sub)")

                        .foregroundColor(homeStore.selectSub.contains(sub) ? .myBlack : .myLightGray)
                        .font(homeStore.selectSub.contains(sub) ? .body1Bold : .body1Regular)
                }
                .listRowBackground(Color.myWhite)
            }
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
        .scrollIndicators(.hidden)
    }
}

struct PlaceListFilterView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListFilterView(isShowingFilterSheet: .constant(true))
            .environmentObject(HomeStore())
    }
}
