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
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    
                    CustomTextField(placeholder: "장소를 입력해주세요.", text: $placeSearchTextField)
                        .font(.body1Bold)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
                    
                    Button {
                        homeStore.searchPlaceName(placess: homeStore.places, keyWord: placeSearchTextField)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.head1Bold)
                            .foregroundColor(.mySecondary)
                    }.buttonStyle(.plain)
                        .padding(.trailing, 20)
                    
                }// HStack
                ScrollView(showsIndicators: false) {
                    LazyVStack{
                        if homeStore.filteredArray.isEmpty{
                            Text("추천검색어")
                        }else{
                            ForEach(homeStore.filteredArray) { place in
                                HomeListRow(place: place)
                                    .padding([.bottom], 10)
                            }
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
                            Image(systemName: "chevron.left")
                                .foregroundColor(.myPrimary)
                            
                        }// HSTACK
                        .padding(.leading, 10)
                    }
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
