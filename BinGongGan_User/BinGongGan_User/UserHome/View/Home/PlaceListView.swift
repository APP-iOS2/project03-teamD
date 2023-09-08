//
//  PublicOfficeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PlaceListView: View {
    
    @EnvironmentObject var homeStore: HomeStore 
    @State var category: String
    var body: some View {
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(showsIndicators: false){
                    ForEach(homeStore.places){ place in
                        if category == place.category.rawValue {
                            PlaceListRow(place: place)
                                .padding(.bottom, 20)
                        }
                    }
                }// SCROLLVIEW
                .padding(.top, 20)
            }// VSTACK
            .navigationTitle("\(category)")
            .navigationBarTitleDisplayMode(.inline)
            .customBackbutton()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // 필터 모달
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.mySecondary)
                            .font(.body1Bold)
                    }
                }
            }
        }// ZSTACK
        .background(Color.myBackground)
    }// BODY
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PlaceListView(category: "공유오피스")
                .environmentObject(HomeStore())
        }
    }
}
