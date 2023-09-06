//
//  GongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct GongGanDetailView: View {
    @StateObject var gongGan: GongGanStore = GongGanStore()
    @State private var heartButton: Bool = false
    @State private var isActionSheetPresented = false
    private let screenWidth = UIScreen.main.bounds.width
    enum viewFrame {
        static let haltWidth = (UIScreen.main.bounds.width / 2)
        static let buttonHeight = CGFloat(60)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                TabView{
                    ForEach(gongGan.tempImage, id: \.self) { image in
                        AsyncImage(url: URL(string: image)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: screenWidth , height: 250)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("서울역 15번 출구 도보 5분")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(5)
                        .background(Color.myPrimary)
                        .cornerRadius(5)
                    
                    HStack {
                        Text("[서울역] 갬성 파티룸")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button {
                            heartButton.toggle()
                        } label: {
                            Image(systemName: heartButton ? "heart.fill" : "heart")
                                .font(.title3)
                                .foregroundColor(.red)
                        }
                    }
                    Text("공유주방/ 파티룸/ 블루투스 스피커")
                        .foregroundColor(Color.myDarkGray)
                    SubGongGanSelectView()
                        .environmentObject(gongGan)
                    
                    HStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.myLightGray)
                            .frame(width: screenWidth * 0.8, height: 50)
                            .shadow(radius: 2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .overlay(
                                        Text("결제 후 바로 예약 확정")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                    )
                            )
                            .padding()
                        Spacer()
                    }
                    gongGan.customSection("공간 소개")
                    ForEach(1..<5, id: \.self) { i in
                        Text("\(i)")
                    }
                    .padding(.horizontal, 5)
                    gongGan.customSection("시설 안내")
                    ForEach(1..<5, id: \.self) { i in
                        Text("\(i)")
                    }
                    .padding(.horizontal, 5)
                }
                .padding(EdgeInsets(top: 1, leading: 10, bottom: 1, trailing: 10))
                
            }
            
            HStack {
                Button {
                    isActionSheetPresented = true
                } label: {
                    Label("전화", systemImage: "phone.fill")
                        .frame(width: viewFrame.haltWidth)
                        .foregroundColor(.white)
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 1)
                    .padding(.vertical, 5)
                NavigationLink {
                    Text("예약 화면")
                } label: {
                    Text("예약 신청")
                        .frame(width: viewFrame.haltWidth)
                        .foregroundColor(.yellow)
                }
                
            }
            .frame(height: 50)
            .font(.body1Regular)
            .background(Color.myPrimary)
            .padding(.bottom, 10)
            .navigationTitle("BinGongGan")
            .navigationBarTitleDisplayMode(.inline)
            .actionSheet(isPresented: $isActionSheetPresented) {
                ActionSheet(
                    title: Text("전화 문의"),
                    buttons: [
                        .default(Text("전화 1011111111")) {
                            // 전화 걸기 버튼을 눌렀을 때 실행할 작업
                            if let phoneURL = URL(string: "tel://01011111111") {
                                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                            }
                        },
                        .cancel() {
                            // 취소 버튼을 눌렀을 때 실행할 작업
                        }
                    ]
                )
            }
        }
    }
}

struct GongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GongGanDetailView()
    }
}
