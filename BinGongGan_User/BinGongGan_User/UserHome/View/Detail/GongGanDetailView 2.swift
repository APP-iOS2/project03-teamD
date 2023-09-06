//
//  GongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI

struct GongGanDetailView: View {
    @StateObject var gongGan: GongGanStore = GongGanStore()
    private let screenWidth = UIScreen.main.bounds.width
    
    enum namespace {
        static let brown = Color(CGColor(red: 0.40, green: 0.36, blue: 0.33, alpha: 1.00))
    }
    
    var body: some View {
        NavigationStack {
            List {
                TabView{
                    Image("detailSample1")
                    Image("detailSample2")
                    Image("detailSample3")
                }
                .scaledToFill()
                .tabViewStyle(PageTabViewStyle())
                .frame(width: screenWidth , height: 250)
                VStack(alignment: .leading, spacing: 10) {
                    Text("서울역 15번 출구 도보 5분")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(5)
                        .background(namespace.brown)
                        .cornerRadius(5)
                    
                    Text("[서울역] 갬성 파티룸")
                        .font(.title2)
                        .bold()
                    Text("공유주방/ 파티룸/ 블루투스 스피커")
                        .opacity(0.6)
                    VStack(alignment: .leading) {
                        Text("세부공간 선택")
                            .bold()
                        Rectangle()
                            .frame(height: 2)
                        
                        ForEach($gongGan.gongGanStore.detailGongGan) { $space in
                            Button {
                                for index in 0..<gongGan.gongGanStore.detailGongGan.count {
                                    gongGan.gongGanStore.detailGongGan[index].isSelected = false
                                } // 하나의 버튼만 클릭 이미지 표시
                                space.isSelected.toggle()
                            } label: {
                                VStack(alignment: .leading) {
                                    Label(space.title, systemImage: space.isSelected ? "circlebadge.fill" : "circlebadge")
                                        .foregroundColor(.black)
                                    if space.isSelected {
                                            SubGongGanDetailView()
                                    }
                                }
                            }
                            .padding(3)
                        }
                        .buttonStyle(.plain)
                        
                    }
                    .padding(.top, 10)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .padding(.top, 1)
            
            HStack {
                Button {
                    //
                } label: {
                    Label("전화", systemImage: "phone.fill")
                        .frame(width: screenWidth / 2)
                        .foregroundColor(.white)
                }
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 1)
                Button {
                    //
                } label: {
                    Text("예약 신청")
                        .frame(width: screenWidth / 2)
                        .foregroundColor(.yellow)
                }
            }
            .frame(height: 60)
            .font(.title2)
            .background(namespace.brown)
            .padding(.bottom, 10)
        }
    }
}


struct GongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GongGanDetailView()
    }
}
