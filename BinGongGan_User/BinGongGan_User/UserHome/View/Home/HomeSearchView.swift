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
                        Image("멈무로고")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: ImageLogoConstant.width , height: ImageLogoConstant.height)
                        .cornerRadius(15)
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
