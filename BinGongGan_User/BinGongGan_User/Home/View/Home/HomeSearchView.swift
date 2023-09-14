//
//  HomeSearchView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct HomeSearchView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    @State private var placeSearchTextField: String = ""
    @State private var isChangeTextField: Bool = true
    @State var isLoading: Bool = true
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
                        homeStore.searchPlaceName(keyWord: placeSearchTextField)
                        
                        if !homeStore.recentlyWords.contains(placeSearchTextField){
                            homeStore.addRecentlyWord(word: placeSearchTextField)
                        }
                        placeSearchTextField = ""
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.head1Bold)
                            .foregroundColor(.myBrown)
                    }.buttonStyle(.plain)
                        .padding(.trailing, 20)
                    
                }// HStack
                .padding(.bottom, 3)
                VStack {
                    HStack {
                        Text("최근검색어")
                            .font(.head1Bold)
                            .foregroundColor(.myBrown)
                        Button {
                            homeStore.recentlyWords.removeAll()
                        } label: {
                            Image(systemName: "trash")
                                .font(.captionRegular)
                                .foregroundColor(.myBrown)
                        }
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            ForEach(homeStore.recentlyWords.reversed(), id: \.self){ word in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: HomeNameSpace.screenWidth * 0.20, height: HomeNameSpace.screenHeight * 0.08)
                                        .foregroundColor(.myMint)
                                        .opacity(0.2)
                                    HStack {
                                        Text("\(word)")
                                            .foregroundColor(.black)
                                            .font(.captionBold)
                                            .frame(width: HomeNameSpace.screenWidth * 0.12, height: HomeNameSpace.screenHeight * 0.08)
                                            .padding(.leading, 5)
                                        Button {
                                            placeSearchTextField = word
                                            homeStore.deleteRecentlyWord(word: word)
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
                    .frame(height: 30)
                    Divider()
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
                .redacted(reason: isLoading ? .placeholder :
                            [])
                .onAppear {
                    
                    Task {
                        await homeStore.fetchPlaces()
                        self.isLoading = false
                    }
                }
                .padding(.bottom, HomeNameSpace.scrollViewBottomPadding)
            }// VStack
            .navigationTitle("장소 검색")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onTapGesture {
            self.endTextEditing()
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
