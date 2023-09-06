//
//  HomeSearchView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

enum HomeSearchViewConstant {
    
    static let zStackWidth = CGFloat(100)
    static let zStackHeight = CGFloat(50)
    static let zStackCornerRadius = CGFloat(15)
    
}

struct HomeSearchView: View {
    
    @Environment(\.dismiss) private var dismiss
    private let screenWidth = UIScreen.main.bounds.width
    @State private var placeSearchTextField: String = ""
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Color.gray // 나중에 앱 컬러로 바꿔야함
                    HStack {
                        TextField("장소를 입력해주세요.", text: $placeSearchTextField)
                            .padding()
                    }
                }// ZStack
                .frame(width: screenWidth - HomeSearchViewConstant.zStackWidth ,
                       height: HomeSearchViewConstant.zStackHeight)
                .cornerRadius(HomeSearchViewConstant.zStackCornerRadius)
                .padding()
                Button {
                    
                } label: {
                    Text("검색")
                }
                Spacer()
            }// HStack
            
        }// VStack
        .navigationTitle("검색")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.brown)
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
