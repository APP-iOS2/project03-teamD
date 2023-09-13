//
//  ChartView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/06.
//

import SwiftUI
import Charts
import BinGongGanCore

struct ChartView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var chartStore: ChartStore = ChartStore()
    
    @State private var pickedPlace: String = ""
    
    var places: [Place] = [
        Place(sellerId: "", placeName: "공간1", placeCategory: .share, placeImageStringList: [], note: [], placeInfomationList: [], address: .init(address: "", placeName: "", longitude: "", latitude: "")),
        Place(sellerId: "", placeName: "공간2", placeCategory: .share, placeImageStringList: [], note: [], placeInfomationList: [], address: .init(address: "", placeName: "", longitude: "", latitude: "")),
    ]
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Text("공간별 통계")
                        .padding([.top, .leading], 20)
                        .font(.head1Bold)
                    Spacer()
                    Picker("Place", selection: $pickedPlace) {
                        ForEach(places) { place in
                            Text("\(place.placeName)")
                        }
                    }
                    .onChange(of: pickedPlace) { newValue in
                        // TODO: 공간을 고를 때마다 해당하는 데이터 패치하기
                    }
                }
                
                VStack {
                    HStack {
                        Text("영석키친")
                            .font(.head1Bold)
                        Text("#132")
                            .font(.head1Bold)
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("서울특별시 강남구 논현로 30 뉴진스")
                        Spacer()
                    }
                    
                    HStack {
                        Text("12000원 / 시간당")
                        Spacer()
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(15)
                .padding()
                
                Chart {
                    ForEach(chartStore.monthlyData) { data in
                        LineMark(
                            x: .value("month", data.month),
                            y: .value("Value", data.value)
                        )
                        .foregroundStyle(by: .value("Category", data.category))
                    }
                }
                .padding()
            }
        }
        .background(Color.myBackground)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .customBackbutton()
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChartView()
                .environmentObject(ChartStore())
        }
    }
}
