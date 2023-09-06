//
//  PublicOfficeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PlaceListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var dummyStore: HomeStore = HomeStore()
    @State var category: String
    var body: some View {
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            VStack {
                
                ScrollView(showsIndicators: false){
                    ForEach(dummyStore.places){ place in
                        if category == place.category.rawValue{
                            HomeListRow(place: place)
                        }
                    }
                }// SCROLLVIEW
                .padding(.top, 20)
            }// VSTACK
            .navigationTitle("공용 오피스")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
    //                    Image(systemName: "chevron.left")
    //                        .foregroundColor(.brown)
                        HomeStore.backButton("https://item.kakaocdn.net/do/a1ccece94b4ba1b47f0e5dbe05ce65687e6f47a71c79378b48860ead6a12bf11")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // 필터 모달
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.mySecondary)
                        
                    }
                }
        }
        }
    }// BODY
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PlaceListView( category: "공용 주방")
        }
    }
}
