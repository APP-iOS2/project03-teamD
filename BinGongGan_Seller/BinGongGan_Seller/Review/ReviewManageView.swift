//
//  ReviewManageView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReviewManageView: View {
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var placeStore: PlaceStore
    
    @State private var selectedPlace: String = ""
    
    var places: [String] = ["공간1", "공간2"]
    var placeReview: [Review] = []
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Picker("", selection: $selectedPlace) {
                            ForEach(places, id: \.self) { place in
                                Text("\(place)")
                            }
                        }
                    }
                    
                    ForEach(1...3, id: \.self) { _ in
                        NavigationLink {
                            ReviewManageDetailView()
                        } label: {
                            ReviewCell()
                                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        }
                    }

                    Spacer()
                }
                .navigationTitle("리뷰 관리")
            }
        }
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
        }
//        .onAppear {
//            /// 임시 더미 데이터
//            placeStore.placeList = [
//                PlaceModel(
//                    placeName: "공간1",
//                    placePrice: "",
//                    placeCategory: "",
//                    placeAdress: "",
//                    placeImageStringList: [],
//                    informationToPass: "",
//                    placeInfomationList: [],
//                    reviews: [
//                        Review(date: "9/1", rating: 4.0, content: "공간1에 대한 리뷰인데요?")
//                    ]
//                ),
//                PlaceModel(
//                    placeName: "공간1",
//                    placePrice: "",
//                    placeCategory: "",
//                    placeAdress: "",
//                    placeImageStringList: [],
//                    informationToPass: "",
//                    placeInfomationList: [],
//                    reviews: [
//                        Review(date: "9/4", rating: 4.0, content: "공간1에 대한 리뷰인데요? 아닌데요? 맞는데요?")
//                    ]
//                ),
//                PlaceModel(
//                    placeName: "공간2",
//                    placePrice: "",
//                    placeCategory: "",
//                    placeAdress: "",
//                    placeImageStringList: [],
//                    informationToPass: "",
//                    placeInfomationList: [],
//                    reviews: [
//                        Review(date: "9/4", rating: 2.0, content: "공간2에 대한 리뷰인데요?")
//                    ]
//                )
//            ]
//        }
    }
}

struct ReviewManageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewManageView()
                .environmentObject(PlaceStore())
        }
    }
}
