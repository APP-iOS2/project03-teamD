//
//  HomeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import BinGongGanCore


struct HomeView: View {
    
    @ObservedObject var dummyStore: HomeStore = HomeStore()
    private let screenWidth = UIScreen.main.bounds.width
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
                        
                        HStack {
                            Text("인기 플레이스")
                                .font(.body1Regular)
                                .padding([.leading, .top], 20)
                            Spacer()
                        }
                        
                        FavoriteListView()
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        
                        HStack {
                            Text("이런 공간은 어떠세요?")
                                .font(.body1Regular)
                            Spacer()
                        }.padding(.leading, 20)
                        
                        ForEach(dummyStore.places) { place in
                            HomeListRow(place: place)
                        }
                        .padding(.bottom, 10)
                        HomeEventTapView()
                            .padding(.bottom, 10)
                    }// GROUP
                }// LazyVStack
                .padding(.bottom, 10)
               
            }// SCROLLVIEW
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("HomeLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(.leading, 10)
                }
            }
            
        }// ZSTACK
        
    }// BODY
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeView(tabBarVisivility: .constant(.visible))
        }
    }
}
