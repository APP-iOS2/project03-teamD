//
//  ReservationSellerInfoView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/07.
//

import SwiftUI

struct ReservationSellerInfoView: View {
    
    @State private var openRefundPolicySheet: Bool = false
    @State private var checkRefundPolicy: Bool = false
    
    @EnvironmentObject var reservationStore: ReservationStore
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("이용 시 주의 사항")
                .font(.body1Regular)
            ZStack {
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .frame(maxWidth: screenWidth * 0.9, minHeight: 40)
                
                Text("판매자 형식 반영 제작")
                    .font(.captionRegular)
            }
            .padding(.bottom, 10)
            
            
            Text("환불 규정")
                .font(.body1Regular)
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .frame(maxWidth: screenWidth * 0.9, minHeight: 40)
                HStack {
                    Text("환불 규정 확인하기")
                        .font(.captionRegular)
                    // Spacer()
                    Button {
                        // sheet 올리기 -> sheet 속 버튼 누르면 활성화되도록
                        openRefundPolicySheet.toggle()
                        
                    } label: {
                        Text("확인")
                            .foregroundColor(.blue)
                            .padding(.leading, 20)
                    }
                }
            }
            .padding(.bottom, 10)
        }
        .sheet(isPresented: $openRefundPolicySheet, content: {
            NavigationStack {
                RefundPolicySheetView()
                    .environmentObject(reservationStore)
            }
        })
    }
}

struct ReservationSellerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationSellerInfoView()
            .environmentObject(ReservationStore())
    }
}
