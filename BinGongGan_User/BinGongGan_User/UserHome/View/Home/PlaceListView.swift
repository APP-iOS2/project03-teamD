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
                Text("sad")
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
                            .foregroundColor(.myPrimary)
                            .font(.body1Bold)
                    }
                }
            }
        }// ZSTACK
        .background(Color.myBackground)
    }// BODY
//    @ViewBuilder
//    private func tabAnimate() -> some View {
//        HStack {
//            ForEach(ReservationHistoryType.allCases, id: \.self) { item in
//                VStack {
//                    Text(item.rawValue)
//                        .font(.footnote)
//                        .frame(maxWidth: .infinity/6, minHeight: 30)
//                        .foregroundColor(selectedPicker == item ? .black : .gray)
//
//                    if selectedPicker == item {
//                        Capsule()
//                            .foregroundColor(.myPrimary)
//                            .frame(height: 3)
//                            .matchedGeometryEffect(id: "info", in: animation)
//                    }
//
//                }
//                .padding()
//                .onTapGesture {
//                    withAnimation(.easeInOut) {
//                        self.selectedPicker = item
//                    }
//                }
//            }
//        }
//    }
    
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PlaceListView(category: "공유오피스")
                .environmentObject(HomeStore())
        }
    }
}
