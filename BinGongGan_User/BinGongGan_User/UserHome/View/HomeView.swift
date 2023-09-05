//
//  HomeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum ImageLogoConstant {
    static let width = CGFloat(50)
    static let height = CGFloat(50)
}

enum HomeViewConstant {
    static let eventTapWidth = CGFloat(60)
    static let eventTapHeight = CGFloat(50)
    static let eventTapCornerRadius = CGFloat(15)
    static let padding = CGFloat(10)
}

struct HomeView: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack{
            VStack {
                HomeEventTapView()
                    .padding(.bottom, HomeViewConstant.padding )
                
                Text("어떤 공간이 필요하세요?")
                    .font(.title2)
                    .frame(width: .infinity , height: 50)
                    .padding(.bottom , HomeViewConstant.padding + 15)
                
                HomePlaceListView()
                
            }// VSTACK
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Image("dummyLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: ImageLogoConstant.width , height: ImageLogoConstant.height)
                        Spacer()
                    }// HSTACK
                    .padding(.all, HomeViewConstant.padding)
                }
                ToolbarItem {
                    NavigationLink {
                        HomeSearchView()
                    } label: {
                        RoundedRectangle(cornerRadius: HomeViewConstant.eventTapCornerRadius)
                            .frame(width: screenWidth - HomeViewConstant.eventTapWidth , height: HomeViewConstant.eventTapHeight)
                            .foregroundColor(.gray)
                            .overlay {
                                Text("어떤 장소를 찾고 계신가요? ")
                                    .foregroundColor(.black)
                            }
                    }
                    .padding(.bottom, HomeViewConstant.padding)
                }
            }
        }// NAVIGATIONSTACK
    }// BODY
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeView()
        }
    }
}
