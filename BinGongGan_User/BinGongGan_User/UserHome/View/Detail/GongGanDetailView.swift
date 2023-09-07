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
    
    @StateObject var reservationStore: ReservationStore = ReservationStore()
    var body: some View {
        NavigationStack {
            ZStack {
                Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    
                    DetailTabImageView()
                    
                    Group {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("서울역 공유키친, 파티룸")
                                .font(.title2)
                            Text("서울 송파구 송파대로 28길 13 (가락동, 거북이빌딩)")
                                .foregroundColor(Color.myDarkGray)
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    
                    
                    Divider()
                        .frame(width: screenWidth * 0.95)
                    
                    Group {
                        HStack {
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.myLightGray)
                                .opacity(0.5)
                                .frame(width: screenWidth * 0.95, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.clear, lineWidth: 1)
                                        .overlay(
                                            Label("본 매장은 결제 후 승인시 확정 됩니다.", systemImage: "info.circle")
                                                .font(.subheadline)
                                                .foregroundColor(.myMediumGray)
                                        )
                                )
                            Spacer()
                        }
                    }
                    .padding(.vertical, 10)
                    
                    Rectangle()
                        .fill(Color.myLightGray)
                        .frame(height: 5)
                    
                    VStack(spacing: 20) {
                        Group {
                            SubGongGanSelectView()
                                .environmentObject(gongGan)
                        }
                        .frame(width: screenWidth * 0.95)
                        
                        Group {
                            VStack(alignment: .leading, spacing: 10) {
                                gongGan.customSection("건물 정보")
                                ForEach(gongGan.tempSummary, id: \.self) { summary in
                                    Text("◦ \(summary)")
                                        .font(.subheadline)
                                        .foregroundColor(.myDarkGray)
                                }
                                
                            }
                        }
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                        
                        Group {
                            gongGan.customSection("시설 안내")
                            HStack(spacing: 40) {
                                ForEach(gongGan.tempLabel) { label in
                                    VStack {
                                        Image(systemName: label.systemImage)
                                            .resizable()
                                            .frame(width: 40,height: 30)
                                        
                                        Text(label.text)
                                    }
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 20, trailing: 0))
                        
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 60)
                }
                
                VStack{
                    Spacer()
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
                            ReservationView()
                                .environmentObject(reservationStore)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("예약 신청")
                                .frame(width: viewFrame.haltWidth)
                                .foregroundColor(.yellow)
                        }
                    }
                    .frame(height: 50)
                    .font(.body1Regular)
                    .background(Color.myPrimary)
                    .padding(.bottom, 0.1)
                }
            }
            
            
            
            
            .navigationTitle("BinGongGan")
            .navigationBarTitleDisplayMode(.inline)
            .actionSheet(isPresented: $isActionSheetPresented) {
                ActionSheet(
                    title: Text("전화 문의"),
                    buttons: [
                        .default(Text("전화 010 3939 3838")) {
                            if let phoneURL = URL(string: "tel://01039393838") {
                                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                            }
                        },
                        .cancel() {
                        }
                    ]
                )
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        heartButton.toggle()
                    } label: {
                        Image(systemName: heartButton ? "heart.fill" : "heart")
                            .foregroundColor(Color.myPrimary)
                    }
                }
            }
        }
    }
}

struct GongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            GongGanDetailView()
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            GongGanDetailView()
                .tabItem {
                    Label("내 주변", systemImage: "location.circle")
                }
            GongGanDetailView()
                .tabItem {
                    Label("찜", systemImage: "heart")
                }
            GongGanDetailView()
                .tabItem {
                    Label("마이페이지", systemImage: "book")
                }
        }
        .tint(.myPrimary)
    }
}
