//
//  HomeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

enum HomeNameSpace {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.width
    static let scrollViewBottomPadding = CGFloat(10)
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HomeView: View {
    
    @EnvironmentObject var homeStore: HomeStore
    @Binding var tabBarVisivility: Visibility
    
    var body: some View {
        
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    NavigationLink {
                        MapSearchView(tabBarVisivility: $tabBarVisivility)
                            .toolbar(tabBarVisivility, for: .tabBar)
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.myBrown, lineWidth: 1)
                            .background()
                            .frame(height: 50)
                            .overlay(alignment: .leading) {
                                HStack {
                                    Image("SearchViewImage")
                                        .foregroundColor(.myDarkGray)
                                        .padding(.leading)
                                    Text(" 내 주변 검색하기")
                                        .font(.body1Bold)
                                        .foregroundColor(.myBrown)
                                }
                            }
                            .padding()
                    }
                    Group {
                        HomeCategoryView()
                            .padding([.leading, .trailing], 20)
                            
                        HStack {
                            Text("인기 플레이스")
                                .font(.head1Bold)
                                .foregroundColor(.myBrown)
                                .padding(.leading, 20)
                                .padding(.top, 7)
                            Spacer()
                        }
                        
                        FavoriteListView()
                            .padding(.horizontal)
                            .padding(.bottom, 13)
                        
                        HStack {
                            Text("이런 공간은 어떠세요?")
                                .font(.head1Bold)
                                .foregroundColor(.myBrown)
                            Spacer()
                            Button {
                                homeStore.settingRecommendPlace()
                            } label: {
                                Image(systemName: "goforward")
                                    .font(.body1Regular)
                                    .foregroundColor(.myBrown)
                            }
                        }
                        .padding([.leading, .trailing], 20)
                        
                        ForEach(homeStore.recommendPlace) { place in
                            HomeListRow(place: place)
                        }
                        .padding(.bottom, 10)
                        
                        HomeEventTapView()
                            .padding([.top, .bottom], 7)
                        Text("Copyright © 2023 Apple Inc. All rights reserved.")
                            .font(.footnote)
                            .foregroundColor(.myLightGray)
                        
                    }// GROUP
                }// LazyVStack
                .padding(.bottom, HomeNameSpace.scrollViewBottomPadding)
            }// SCROLLVIEW
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                homeStore.selectSub.removeAll()
                homeStore.settingRecommendPlace()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("HomeLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        .padding([.bottom, .leading], 10)
                        Text("BinGongGan")
                            .font(.body1Bold)
                    }
                }
            }
        }// ZSTACK
        .onAppear {
            
        }
    }// BODY
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeView(tabBarVisivility: .constant(.visible))
                .environmentObject(HomeStore())
        }
    }
}
