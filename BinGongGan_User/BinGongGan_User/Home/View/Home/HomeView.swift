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
    func easterEgg(
        isPresented: Binding<Bool>,
        title: String,
        primaryButtonTitle: String,
        primaryAction: @escaping () -> Void
    ) -> some View {
        return modifier(
            EasterEggModifier(
                isPresented: isPresented,
                title: title,
                primaryButtonTitle: primaryButtonTitle,
                primaryAction: primaryAction
            )
        )
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
    
    @EnvironmentObject var myUserStore: MyUserStore
    @EnvironmentObject var homeStore: HomeStore
    @Binding var tabBarVisivility: Visibility
    @State var isMung: Bool = false
    var body: some View {
        
        ZStack {
            Spacer().background(Color(hex: "#F5F5F5")).ignoresSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                
                    NavigationLink {
                        MapSearchView(tabBarVisivility: $tabBarVisivility)
                            .toolbar(tabBarVisivility, for: .tabBar)
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.myBrown, lineWidth: 1)
                            .background(.white)
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
                        HStack {
                            Text("Copyright")
                                .font(.footnote)
                            .foregroundColor(.myLightGray)
                            Button {
                                isMung = true
                                homeStore.addMungCount()
                            } label: {
                                Text("©")
                            }
                            Text("2023 Apple Inc. All rights reserved.")
                                .font(.footnote)
                                .foregroundColor(.myLightGray)
                        }
                    }// GROUP
                
                .padding(.bottom, HomeNameSpace.scrollViewBottomPadding)
            }// SCROLLVIEW
            .refreshable {
                await homeStore.fetchPlaces()
                homeStore.settingRecommendPlace()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                homeStore.selectSub.removeAll()
                homeStore.settingRecommendPlace()
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("HomeLogo" )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 35)
                        .padding([.bottom, .leading], 10)
                        Text(isMung ? "mungmoongE" : "BinGongGan")
                            .font(.body1Bold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text("\(myUserStore.currentUser.nickname)님")
                            .font(.captionRegular)
                    }
                }
            }
        }// ZSTACK
        .onAppear(){
            Task{
                try await myUserStore.fetchCurrentUser()
            }
        }
        .easterEgg(isPresented: $isMung, title: homeStore.mungText[homeStore.mungImageCount], primaryButtonTitle: "닫기") {}
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


