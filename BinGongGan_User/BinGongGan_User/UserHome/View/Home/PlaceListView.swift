//
//  PublicOfficeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PlaceListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var homeStore: HomeStore 
    @State var category: String
    var body: some View {
        ZStack {
            Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(showsIndicators: false){
                    ForEach(homeStore.places){ place in
                            PlaceListRow(place: place)
                    }
                }// SCROLLVIEW
                .padding(.top, 20)
            }// VSTACK
            .navigationTitle("공용 오피스")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
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
    }// BODY
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PlaceListView( category: "공용 주방")
                .environmentObject(HomeStore())
        }
    }
}
