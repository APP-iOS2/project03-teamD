//
//  PublicOfficeView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI

struct PublicPlaceListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var dummyStore: DummyStore = DummyStore()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    // 필터기능추가
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.black)
                }
                .padding()
            }// HSTACK
            
            ScrollView(showsIndicators: false){
                ForEach(dummyStore.publicPlaceList){ place in
                    PublicPlaceListRow(place: place)
                }
            }// SCROLLVIEW
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
                    Image("멈무로고")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: ImageLogoConstant.width , height: ImageLogoConstant.height)
                        .cornerRadius(15)
                }
            }
        }
    }// BODY
}

struct PublicOfficeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PublicPlaceListView()
        }
    }
}
