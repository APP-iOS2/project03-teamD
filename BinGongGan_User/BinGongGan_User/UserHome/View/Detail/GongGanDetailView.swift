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
                    
                    DtaileTabImageView()
                    
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
                                gongGan.customSection("공간 소개")
                                ForEach(gongGan.tempSummary, id: \.self) { summary in
                                    Text("◦ \(summary)")
                                        .font(.subheadline)
                                        .foregroundColor(.myDarkGray)
                                }
                                
                            }
                        }
                        
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
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 15)
                    
                    
                }
            }
            .padding(EdgeInsets(top: 1, leading: 0, bottom: -5, trailing: 0))
        
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
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        heartButton.toggle()
                    } label: {
                        Image(systemName: heartButton ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                    }
                }
            }
            
            .background(Color.myBackground).ignoresSafeArea()
        }
    }
}

struct GongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GongGanDetailView()
    }
}
