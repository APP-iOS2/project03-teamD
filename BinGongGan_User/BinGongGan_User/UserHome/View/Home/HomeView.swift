//
//  HomeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum TestColor {
    static let brown = Color(CGColor(red: 0.40, green: 0.36, blue: 0.33, alpha: 1.00))
    static let green = Color(CGColor(red: 0.55, green: 0.73, blue: 0.76, alpha: 1.00))
    static let white = Color("dummyWhite")
}
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
                        .foregroundColor(TestColor.brown)
                        .overlay {
                            HStack {
                                Spacer()
                                Text("어떤 장소를 찾고 계신가요? ")
                                    .foregroundColor(.black)
                                    .bold()
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
                            .font(.title2)
                            .bold()
                            .padding(.top, 5)
                        PlaceListButtonView()
                            .padding(.bottom, HomeViewConstant.padding + 10)
                        
                        Text("이런 공간은 어떠세요?")
                            .font(.title2)
                            .bold()
                        
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
                        Image("dogLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: ImageLogoConstant.width , height: ImageLogoConstant.height)
                            .cornerRadius(15)
                        Spacer()
                    }// HSTACK
                    .padding(.all, HomeViewConstant.padding)
                }
            }
        }// NAVIGATIONSTACK
        .background(TestColor.white)
    }// BODY
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeView()
        }
    }
}
