//
//  PublicOfficeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PlaceListView: View {
    
    @EnvironmentObject var homeStore: HomeStore 
    @State var category: String
    @State var isShowingFilterSheet: Bool = false
    @State var selectSub: [String] = ["전체"]
    var body: some View {
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            VStack {
                    HStack {
                        if selectSub.count == 0 {
                            Text("필터 버튼을 통해서 원하는 검색결과를 찾아보세요!")
                                .font(.body1Regular)
                                .foregroundColor(.myPrimary)
                        } else {
                            HStack {
                                
                                Text("조건을 필터한 결과입니다.")
                                    .font(.body1Regular)
                                    .foregroundColor(.myPrimary)
                            }
                        }
                    }.frame(height: HomeNameSpace.screenHeight * 0.08)
                    .padding(.top, 10)
                ScrollView(showsIndicators: false){
                    // 가야할 데이터 카테고리 별 값 , 처음엔 전체 , 그후에는 필터로  
                    ForEach(homeStore.filteredArray){ place in
                        PlaceListRow(place: place)
                            .padding(.bottom, 20)
//                        if category == place.category.rawValue {
//                            ForEach(selectSub, id: \.self) { sub in
//                                if place.placeLocation.contains(sub){
//
//                                }
//                            }
//                        }
                    }
                } // SCROLLVIEW
                .onAppear{
                    homeStore.filteredPlaceList(category: category, cities: selectSub)
                }
                
            }// VSTACK
            .navigationTitle("\(category)")
            .navigationBarTitleDisplayMode(.inline)
            .customBackbutton()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        selectSub.removeAll()
                        isShowingFilterSheet = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.myPrimary)
                            .font(.body1Bold)
                    }
                    .sheet(isPresented: $isShowingFilterSheet) {
                        PlaceListFilterView(isShowingFilterSheet: $isShowingFilterSheet, selectSub: $selectSub, category: $category)
                       
                    }
                }
            }
        }// ZSTACK
        .background(Color.myBackground)
    }// BODY
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PlaceListView(category: "공유오피스")
                .environmentObject(HomeStore())
        }
    }
}
