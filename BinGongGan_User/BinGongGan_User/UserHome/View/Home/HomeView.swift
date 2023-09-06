//
//  HomeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

enum ImageLogoConstant {
    static let width = CGFloat(50)
    static let height = CGFloat(50)
}

enum HomeViewConstant {
    static let searchButtonWidth = CGFloat(50)
    static let searchButtonHeight = CGFloat(40)
    static let cornerRadius = CGFloat(15)
    static let padding = CGFloat(10)
}

struct HomeView: View {
    
    @ObservedObject var dummyStore: DummyStore = DummyStore()
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    HomeSearchView()
                } label: {
                    RoundedRectangle(cornerRadius: HomeViewConstant.cornerRadius)
                        .frame(width: screenWidth - HomeViewConstant.searchButtonWidth , height: HomeViewConstant.searchButtonHeight)
                        .opacity(0.2)
                        .foregroundColor(Color.myPrimary)
                        .overlay {
                            HStack {
                                Spacer()
                                Text("어떤 장소를 찾고 계신가요? ")
                                    .foregroundColor(.black)
                                    .font(.body1Bold)
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10)
                            }
                        }
                }
                .padding([.top, .bottom], 20)
                .padding([.leading, .trailing], 20)
                ScrollView(showsIndicators: false) {
                    Group {
                        HomeEventTapView()
                            .padding(.bottom, HomeViewConstant.padding + 10)
                        
                        Text("어떤 공간이 필요하세요?")
                            .font(.head1Bold)
                            .padding(.top, 5)
                        PlaceListButtonView()
                            .padding(.bottom, HomeViewConstant.padding + 10)
                        
                        Text("이런 공간은 어떠세요?")
                            .font(.head1Bold)
                        
                        ForEach(DummyStore().publicPlaceList) { place in
                            HomePlaceListRow(place: place)
                                .padding([.leading, .trailing], 10)
                                
                        }
                    }
                }// SCROLLVIEW
            }// VSTACK
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        DummyStore.backButton("https://item.kakaocdn.net/do/a1ccece94b4ba1b47f0e5dbe05ce65687e6f47a71c79378b48860ead6a12bf11")
                            
                        Spacer()
                    }// HSTACK
                    .padding(.all, HomeViewConstant.padding)
                }
            }
        }// NAVIGATIONSTACK
        .background(Color.myBackground)
    }// BODY
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeView()
        }
    }
}
