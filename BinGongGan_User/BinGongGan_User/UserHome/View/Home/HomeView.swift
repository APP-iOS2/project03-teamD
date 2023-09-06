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
}

struct HomeView: View {
    
    @ObservedObject var dummyStore: HomeStore = HomeStore()
    private let screenWidth = UIScreen.main.bounds.width
    private var isTapSearchButton: Bool = false
    
    var body: some View {
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    HomeStore.backButton("https://item.kakaocdn.net/do/a1ccece94b4ba1b47f0e5dbe05ce65687e6f47a71c79378b48860ead6a12bf11")
                    NavigationLink {
                        HomeSearchView()
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: screenWidth * 0.7 , height: HomeViewConstant.searchButtonHeight)
                            .opacity(0.6)
                            .foregroundColor(.myLightGray)
                            .overlay {
                                HStack {
                                    Spacer()
                                    Text("어떤 장소를 찾고 계신가요? ")
                                        .foregroundColor(.black)
                                        .font(.body1Regular)
                                    Spacer()
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.mySecondary)
                                        .padding(.trailing, 10)
                                }
                            }
                            .padding([.top, .bottom], 20)
                            .padding([.leading, .trailing], 5)
                    }
                }// HSTACK
                .padding(EdgeInsets(top: 50, leading: 50, bottom: 10, trailing: 50))
                ScrollView(showsIndicators: false) {
                    LazyVStack{
                        Group {
                            HomeEventTapView().padding(.bottom,  20)
                            
                            Text("어떤 공간이 필요하세요?")
                                .font(.head1Bold)
                                .padding(.top, 5)
                            HomeCategoryView()
                                .padding(.bottom, 20)
                            
                            Text("이런 공간은 어떠세요?")
                                .font(.head1Bold)
                            
                            ForEach(HomeStore().places) { place in
                                HomeListRow(place: place)
                                    .padding([.bottom, .leading, .trailing], 10)
                            }
                        }
                    }// LazyVStack
                }// SCROLLVIEW
                
            }// VSTACK
            .edgesIgnoringSafeArea(.all)
        }// ZSTACK
        
    }// BODY
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeView()
        }
    }
}
