//
//  GongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore


struct GongGanDetailView: View {
    
    @EnvironmentObject var gongGan: GongGanStore
    @EnvironmentObject var favoriteGongGan: MyFavoriteStore
    @StateObject var reservationStore: ReservationStore = ReservationStore()
    @State private var heartButton: Bool = false
    @State private var isActionSheetPresented = false
    @State private var isReservationActive: Int? = nil
    @State private var isShowingReservationView = false
    @State private var isShowingReservationAlert = false
    @State private var selectedSegment: segmentIndex = .info
    @State private var hasFetchedGongGanInfo = false
    @State var placeId: String
    @State var roomId: String = ""
    @Namespace var animation
    
    enum viewFrame {
        static let haltWidth = (UIScreen.main.bounds.width / 2)
        static let buttonHeight = CGFloat(60)
    }
    
    enum segmentIndex: String , CaseIterable {
        case info = "상세 정보"
        case review = "리뷰"
        case event = "공지사항"
    }
    
    
    var body: some View {
        ZStack {
            if gongGan.isLoading {
                ProgressView()
            }else {
                Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    
                    DetailTabImageView(imageUrl: $gongGan.gongGanInfo.placeImageUrl)
                        .frame(height: UIScreen.screenHeight * 0.25)
                    
                    
                    Group {
                        SegmentView(selectedSegment: $selectedSegment, isReservationActive: $isReservationActive, roomId: $roomId, placeId: $placeId, animation: animation)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            isActionSheetPresented = true
                        } label: {
                            Label("전화 문의", systemImage: "phone.fill")
                                .frame(width: viewFrame.haltWidth)
                                .foregroundColor(.white)
                        }
                        
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 1)
                            .padding(.vertical, 5)
                        Button {
                            //                            #if DEBUG
                            //                            print(isReservationActive ?? 101010)
                            //                            #endif
                            if isReservationActive != nil {
                                isShowingReservationView.toggle()
                            } else {
                                isShowingReservationAlert.toggle()
                            }
                        } label: {
                            Text("예약 신청")
                                .frame(width: viewFrame.haltWidth)
                                .foregroundColor(.yellow)
                        }
                        
                        
                    }
                    .frame(height: 50)
                    .font(.body1Regular)
                    .background(Color.myBrown)
                    .padding(.bottom, 0.1)
                }
                .onAppear {
                    if !hasFetchedGongGanInfo {
                        Task {
                            await gongGan.fetchGongGanInfo(placeId: placeId)
                            hasFetchedGongGanInfo = true
                        }
                    }
                    heartButton = gongGan.gongGanInfo.isFavorite
                }
            }
        }
        .navigationTitle("BinGongGan")
        .navigationBarTitleDisplayMode(.inline)
        .toast(isShowing: $isShowingReservationAlert, message: "세부 공간을 선택해 주세요.")
        .actionSheet(isPresented: $isActionSheetPresented) {
            ActionSheet(
                title: Text("전화 문의"),
                buttons: [
                    .default(Text("전화 \(gongGan.gongGanInfo.placePhone)")) {
                        if let phoneURL = URL(string: "tel://\(gongGan.gongGanInfo.placePhone)") {
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
                    Task {
                        favoriteGongGan.updateMyInfo(placeId: placeId)
                        await favoriteGongGan.fetchMyFavorite()
                        await gongGan.fetchGongGanInfo(placeId: placeId)
                    }
                    
                } label: {
                    Image(systemName: gongGan.gongGanInfo.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(Color.myBrown)
                }
            }
        }
        .navigationDestination(isPresented: $isShowingReservationView) {
            
            ReservationView(roomID: $roomId, placeName: $gongGan.gongGanInfo.placeName)
                .environmentObject(reservationStore)
                .navigationBarBackButtonHidden()
        }
    }
    
}

struct GongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationStack {
                GongGanDetailView(placeId: "63wML8jonncvAgn1O9xMtMk0WqM2")
            }
            .environmentObject(GongGanStore())
            .tabItem {
                Label("홈", systemImage: "house")
            }
        }
        .tint(.myBrown)
    }
}
