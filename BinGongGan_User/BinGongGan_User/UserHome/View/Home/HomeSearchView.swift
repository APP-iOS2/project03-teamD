//
//  HomeSearchView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum HomeSearchViewConstant {
    static let searchTextFieldWidth = CGFloat(100)
    static let searchTextFieldHeight = CGFloat(50)
    static let searchTextFieldRadius = CGFloat(15)
}

struct HomeSearchView: View {
    
    @Environment(\.dismiss) private var dismiss
    private let screenWidth = UIScreen.main.bounds.width
    @State private var placeSearchTextField: String = ""
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Color.gray
                    HStack {
                        TextField("장소를 입력해주세요.", text: $placeSearchTextField)
                            .font(.body1Bold)
                            .padding()
                    }
                }// ZStack
                .frame(width: screenWidth - HomeSearchViewConstant.searchTextFieldWidth ,
                       height: HomeSearchViewConstant.searchTextFieldHeight)
                .cornerRadius(HomeSearchViewConstant.searchTextFieldRadius)
                .padding()
                Button {
                    // 검색내용 하는 기능 필요
                } label: {
                    Text("검색")
                        .font(.body1Bold)
                }
                Spacer()
            }// HStack
        }// VStack
        .navigationTitle("장소 검색")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(.brown)
                    HStack {
                        DummyStore.backButton("https://item.kakaocdn.net/do/a1ccece94b4ba1b47f0e5dbe05ce65687e6f47a71c79378b48860ead6a12bf11")
                        Spacer()
                    }// HSTACK
                }
            }
        }
    }// Body
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeSearchView()
        }
    }
}
