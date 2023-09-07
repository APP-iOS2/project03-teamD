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
                            .stroke(Color.myPrimary, lineWidth: 1)
                            .background()
                            .frame(height: 50)
                            .overlay(alignment: .leading) {
                                HStack {
                                    Image("SearchViewImage")
                                        .foregroundColor(.myDarkGray)
                                        .padding(.leading)
                                    Text(" 내 주변 검색하기")
                                        .font(.body1Bold)
                                        .foregroundColor(.myPrimary)
                                }
                            }
                            .padding()
                    }
                    Group {
                        HomeCategoryView()
                            .padding([.leading, .trailing], 20)
                            .environmentObject(homeStore)
                        HStack {
                            Text("인기 플레이스")
                                .font(.head1Bold)
                                .foregroundColor(.myPrimary)
                                .padding([.leading, .top], 20)
                            Spacer()
                        }
                        
                        FavoriteListView()
                            .environmentObject(homeStore)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        
                        HStack {
                            Text("이런 공간은 어떠세요?")
                                .font(.head1Bold)
                                .foregroundColor(.myPrimary)
                            Spacer()
                            Button {
                                homeStore.settingRecommendPlace()
                            } label: {
                                Image(systemName: "goforward")
                                    .font(.body1Bold)
                                    .foregroundColor(.mySecondary)
                            }

                        }.padding([.leading, .trailing], 20)
                        
                        ForEach(homeStore.recommendPlace) { place in
                            HomeListRow(place: place)
                        }
                        .padding(.bottom, 10)
                        
                        HomeEventTapView()
                            .padding(.bottom, 10)
                            .environmentObject(homeStore)
                    }// GROUP
                }// LazyVStack
                .padding(.bottom, 10)
            }// SCROLLVIEW
            .onAppear{
                homeStore.settingRecommendPlace()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("HomeLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding([.bottom, .leading], 10)
                }
            }
        }// ZSTACK
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
