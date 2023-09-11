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
                        if selectSub.contains("전체") {
                            Text("필터 버튼을 통해서 원하는 검색결과를 찾아보세요!")
                                .font(.body1Regular)
                                .foregroundColor(.myPrimary)
                        } else {
                            HStack {
                                Text("조건을 맞는 장소는 \(homeStore.filteredArray.count)개 입니다.")
                                    .font(.body1Regular)
                                    .foregroundColor(.myPrimary)
                            }
                        }
                    }// HSTACK
                    .frame(height: HomeNameSpace.screenHeight * 0.08)
                    .padding(.top, 10)
                ScrollViewReader { reader in
                    ScrollView(showsIndicators: false){
                        ForEach(homeStore.filteredArray){ place in
                            PlaceListRow(place: place)
                                .padding(.bottom, 20)
                        }.id("Scroll_To_Top")
                    } // SCROLLVIEW
                    .onAppear{
                        withAnimation(.default) {
                            
                              reader.scrollTo("Scroll_To_Top",anchor: .top)
                            
                        }
                        homeStore.filteredPlaceList(category: category, cities: selectSub)
                    }
                }// ScrollViewReader
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
