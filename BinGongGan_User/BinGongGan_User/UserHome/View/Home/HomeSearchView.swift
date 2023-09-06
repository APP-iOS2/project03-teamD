//
//  HomeSearchView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum HomeSearchViewConstant {
    static let searchTextFieldWidth = CGFloat(100)
    static let searchTextFieldHeight = CGFloat(50)
    static let searchTextFieldRadius = CGFloat(15)
}

struct HomeSearchView: View {
    
    @Environment(\.dismiss) private var dismiss
    private let screenWidth = UIScreen.main.bounds.width
    @State private var placeSearchTextField: String = ""
    @ObservedObject var homeStore: HomeStore = HomeStore()
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Color.mySecondary
                        .opacity(0.2)
                    HStack {
                        TextField("장소를 입력해주세요.", text: $placeSearchTextField)
                            .font(.body1Bold)
                            .padding()
                            
                    }
                }// ZStack
                .frame(maxWidth: screenWidth * 0.8 ,
                       maxHeight: HomeSearchViewConstant.searchTextFieldHeight)
                .cornerRadius(HomeSearchViewConstant.searchTextFieldRadius)
                .padding()
                
                Button {
                    homeStore.searchPlaceName(placess: homeStore.places, keyWord: placeSearchTextField)
                } label: {
                    Text("검색")
                        .font(.body1Bold)
                        .foregroundColor(.mySecondary)
                }.buttonStyle(.plain)
                Spacer()
            }// HStack
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    ForEach(homeStore.filteredArray) { place in
                        //여기서 장소이름과 검색된 장소이름을 둘다 스토어로 가져가자
                        HomeListRow(place: place)
                            .padding([.bottom], 10)
                    }
                }// LazyVStack
            }// SCROLLVIEW
        }// VStack
        .navigationTitle("장소 검색")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        HomeStore.backButton("https://item.kakaocdn.net/do/a1ccece94b4ba1b47f0e5dbe05ce65687e6f47a71c79378b48860ead6a12bf11")
                        Spacer()
                    }// HSTACK
                }
            }
        }
    }// Body
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeSearchView()
        }
    }
}
