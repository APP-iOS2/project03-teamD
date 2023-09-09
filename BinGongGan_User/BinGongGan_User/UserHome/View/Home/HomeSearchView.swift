//
//  HomeSearchView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct HomeSearchView: View {
    
    @State private var placeSearchTextField: String = ""
    @EnvironmentObject var homeStore: HomeStore
    @State private var isChangeTextField: Bool = true
    
    var body: some View {
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    CustomTextField(placeholder: "장소를 입력해주세요.", text: $placeSearchTextField)
                        .font(.body1Bold)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
                        .frame(minHeight: 42, maxHeight: 52)
                        .onChange(of: placeSearchTextField) { newValue in
                            if placeSearchTextField == "" {
                                isChangeTextField = true
                            } else {
                                isChangeTextField = false
                            }
                        }
                    Button {
                        homeStore.searchPlaceName(placess: homeStore.places, keyWord: placeSearchTextField)
                        
                        if !homeStore.recentlyWords.contains(placeSearchTextField){
                            homeStore.searchRecentlyWord(word: placeSearchTextField)
                        }
                        placeSearchTextField = ""
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.head1Bold)
                            .foregroundColor(.myPrimary)
                    }.buttonStyle(.plain)
                        .padding(.trailing, 20)
                    
                }// HStack
                .padding(.bottom, 3)
                VStack {
                    HStack {
                        Text("최근검색어")
                            .font(.head1Bold)
                            .foregroundColor(.myPrimary)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 2.5) {
                            ForEach(homeStore.recentlyWords, id: \.self){ word in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: HomeNameSpace.screenWidth * 0.2, height: HomeNameSpace.screenHeight * 0.1)
                                            .foregroundColor(.myWhite)
                                        HStack {
                                            Text("\(word)")
                                                .foregroundColor(.myBlack)
                                                .font(.captionBold)
                                                .frame(width: HomeNameSpace.screenWidth * 0.14, height: HomeNameSpace.screenHeight * 0.08)
                                                .padding(.leading, 5)
                                            Button {
                                                placeSearchTextField = word
                                                homeStore.deleteRecentlyWordk(word: word)
                                            } label: {
                                                Image(systemName: "x.circle")
                                                    .font(.captionRegular)
                                                    .foregroundColor(.myDarkGray)
                                            }.padding(.trailing, 10)
                                        }
                                    }// ZSTACK
                            }
                        }// HSTACK
                    }// SCROLLVIEW
                }// VSTACK
                .padding(.leading, 20)
                ScrollView(showsIndicators: false) {
                    LazyVStack{
                        ForEach(homeStore.filteredArray) { place in
                            HomeListRow(place: place)
                                .padding([.bottom], 10)
                        }
                    }// LazyVStack
                }// SCROLLVIEW
                .padding(.bottom, HomeNameSpace.scrollViewBottomPadding)
            }// VStack
            .navigationTitle("장소 검색")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .customBackbutton()
        }
    }// Body
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeSearchView()
                .environmentObject(HomeStore())
        }
    }
}
