//
//  GongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore


struct GongGanDetailView: View {
    
//    @State var gongGanID: String = ""
    
    @EnvironmentObject var gongGan: GongGanStore
    @State private var heartButton: Bool = false
    @State private var isActionSheetPresented = false
    @State private var tabBarVisivility: Visibility = .visible
    @State private var isReservationActive: Int? = nil
    @State private var isShowingReservationView = false
    @State private var isShowingReservationAlert = false
    private let screenWidth = UIScreen.main.bounds.width
    private let screenheight = UIScreen.main.bounds.height
    
    enum viewFrame {
        static let haltWidth = (UIScreen.main.bounds.width / 2)
        static let buttonHeight = CGFloat(60)
    }
    
    enum segmentIndex: String , CaseIterable {
        case info = "상세 정보"
        case review = "리뷰"
        case event = "공지사항"
    }
    
    @StateObject var reservationStore: ReservationStore = ReservationStore()
    @State private var selectedSegment: segmentIndex = .info
    @Namespace var animation
    
    var body: some View {
            ZStack {
                Spacer().background(Color.myBackground).edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    
                    DetailTabImageView(imageUrl: gongGan.gongGanInfo.placeImageUrl)
                        .frame(height: screenheight * 0.25)
                    
                    
                    Group { // 세그먼트
                        SegmentView(selectedSegment: $selectedSegment, isReservationActive: $isReservationActive, screenWidth: screenWidth, animation: animation)
                    }
                }
                
                VStack{
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
            }
            
            .navigationTitle("BinGongGan")
            .navigationBarTitleDisplayMode(.inline)
            
            .alert(isPresented: $isShowingReservationAlert) {
                Alert(
                    title: Text("예약 신청"),
                    message: Text("세부 공간을 선택해 주세요."),
                    dismissButton: .default(Text("돌아가기"))
                )
            }
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
                    } label: {
                        Image(systemName: heartButton ? "heart.fill" : "heart")
                            .foregroundColor(Color.myBrown)
                    }
                }
            }
            .navigationDestination(isPresented: $isShowingReservationView) {
                
                    ReservationView(tabBarVisivility: $tabBarVisivility)
                        .environmentObject(reservationStore)
                        .toolbar(tabBarVisivility, for: .tabBar)
                        .navigationBarBackButtonHidden()
            }
    }
    
}

struct GongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationStack {
                GongGanDetailView()
            }
                    .environmentObject(GongGanStore())
                    .tabItem {
                        Label("홈", systemImage: "house")
                }
        }
        .tint(.myBrown)
    }
}
