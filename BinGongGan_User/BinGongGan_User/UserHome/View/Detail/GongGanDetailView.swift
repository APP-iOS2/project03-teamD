//
//  GongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore


struct GongGanDetailView: View {
    @State var gongGan: GongGan = GongGan.sampleGongGan
    @State private var heartButton: Bool = false
    @State private var isActionSheetPresented = false
    @State private var tabBarVisivility: Visibility = .visible
    private let screenWidth = UIScreen.main.bounds.width
    private let screenheight = UIScreen.main.bounds.height
    
    enum viewFrame {
        static let haltWidth = (UIScreen.main.bounds.width / 2)
        static let buttonHeight = CGFloat(60)
    }
    
    enum segmentIndex: String , CaseIterable {
        case info = "상세 정보"
        case review = "리뷰"
    }
    
    @StateObject var reservationStore: ReservationStore = ReservationStore()
    @State private var selectedSegment: segmentIndex = .info
    @Namespace var animation
    
    var body: some View {
        NavigationStack {
            ZStack {
                Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    
                    DetailTabImageView(imageUrl: gongGan.placeImageUrl)
                        .frame(height: screenheight * 0.25)
                    
                    Group {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(gongGan.placeName)
                                .font(.title2)
                            Text(gongGan.placeLocation)
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
                    Group { // 세그먼트
                        VStack {
                            HStack {
                                ForEach(segmentIndex.allCases, id: \.self) { segment in
                                    VStack {
                                        Text(segment.rawValue)
                                            .font(.subheadline)
                                            .fontWeight(selectedSegment == segment ? .bold : .regular)
                                            .foregroundColor(selectedSegment == segment ? .myPrimary : .black)
                                        
                                        
                                        
                                        if selectedSegment == segment {
                                            Rectangle()
                                                .foregroundColor(.myPrimary)
                                                .frame(maxWidth: screenWidth * 0.45, maxHeight: 2)
                                                .matchedGeometryEffect(id: "item", in: animation)
                                        } else {
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(maxWidth: screenWidth * 0.45, maxHeight: 2)
                                        }
                                    }
                                    .frame(height: 50)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedSegment = segment
                                        }
                                    }
                                }
                            }
                            
                            switch selectedSegment {
                            case .info:
                                SegmentInfoView(gongGan: gongGan)
                            case .review:
                                //                                DetailReviewRowView(text: "맛있어요")
                                Text("리뷰 뷰")
                            }
                        }
                    }
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
                            ReservationView(tabBarVisivility: $tabBarVisivility)
                                .toolbar(tabBarVisivility, for: .tabBar)
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
                        .default(Text("전화 \(gongGan.placePhone)")) {
                            if let phoneURL = URL(string: "tel://\(gongGan.placePhone)") {
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
            GongGanDetailView(gongGan: GongGan.sampleGongGan)
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            //            GongGanDetailView()
                .environmentObject(GongGanStore())
                .tabItem {
                    Label("내 주변", systemImage: "location.circle")
                }
            //            GongGanDetailView()
                .environmentObject(GongGanStore())
                .tabItem {
                    Label("찜", systemImage: "heart")
                }
            //            GongGanDetailView()
                .environmentObject(GongGanStore())
                .tabItem {
                    Label("마이페이지", systemImage: "book")
                }
        }
        .tint(.myPrimary)
    }
}
