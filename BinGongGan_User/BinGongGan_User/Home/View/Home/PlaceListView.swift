//
//  PublicOfficeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PlaceListView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    @State var isShowingFilterSheet: Bool = false
    @State var isLoading: Bool = true
     
    var body: some View {
        
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            VStack {
                    HStack {
                        if homeStore.selectSub.isEmpty {
                            Text("필터 버튼을 통해서 원하는 검색결과를 찾아보세요!")
                                .font(.body1Regular)
                                .foregroundColor(.myBrown)
                        } else {
                            HStack {
                                Text("조건을 맞는 장소는")
                                    .font(.body1Regular)
                                    .foregroundColor(.myBrown)
                                Text("\(homeStore.filteredCategoryCity.count)")
                                    .font(.body1Bold)
                                    .foregroundColor(.myMint)
                                Text("개 입니다.")
                                    .font(.body1Regular)
                                    .foregroundColor(.myBrown)
                            }
                        }
                    }// HSTACK
                    .frame(height: HomeNameSpace.screenHeight * 0.08)
                    .padding(.top, 10)
                ScrollViewReader { reader in
                    ScrollView(showsIndicators: false){
                        ForEach(homeStore.filteredCategoryCity){ place in
                            PlaceListRow(place: place)
                                .padding(.bottom, 20)
                        }.id("Scroll_To_Top")
                    } // SCROLLVIEW
                    .onAppear{
                        withAnimation(.default) {
                            
                              reader.scrollTo("Scroll_To_Top",anchor: .top)
                            
                        }
                        Task {
                            await homeStore.fetchPlaces()
                            self.isLoading = false
                        }
                    }
                }// ScrollViewReader
                .redacted(reason: isLoading ? .placeholder :
                            [])
            }// VSTACK
            
            .navigationTitle("\(homeStore.selectedCategory)")
            .customBackbutton()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        homeStore.selectSub.removeAll()
                        isShowingFilterSheet = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.myBrown)
                            .font(.body1Bold)
                    }
                    .sheet(isPresented: $isShowingFilterSheet) {
                        PlaceListFilterView(isShowingFilterSheet: $isShowingFilterSheet)
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
            PlaceListView()
                .environmentObject(HomeStore())
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
