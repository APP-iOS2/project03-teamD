//
//  RefundPolicySheetView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/06.
//

import SwiftUI

struct RefundPolicySheetView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var reservationStore: ReservationStore
    
    let refundPolicy  = ["환불 불가", "환불 불가", "환불 불가", "환불 불가", "환불 불가", "총 금액의 80% 환불", "총 금액의 100% 환불", "총 금액의 100% 환불"]
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        Form {
            Section("주의 사항") {
                Text("이용딩일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.")
                    .font(.captionRegular)
                Text("결제 후 2시간 이내에는 100% 환불이 가능합니다.(단, 이용시간 전까지만 가능)")
                    .font(.captionRegular)
            }
            .padding([.top, .bottom], 5)
            
            Section("취소 수수료") {
                ForEach(refundPolicy.indices, id: \.self) { index in
                    
                    HStack {
                        Text("이용 \(index + 1)일전")
                            .font(.captionRegular)
                        Divider()
                            .padding(10)
                        Text("\(refundPolicy[index])")
                            .font(.body1Regular)
                    }
                }
            }
            .padding([.top, .bottom], 2)
            
            Button {
                reservationStore.updateReservation(type: .reservationDate, value: Date())
                reservationStore.isPolicyChecked.toggle()
                dismiss()
            } label: {
                Text("확인 완료")
                    .font(.body1Regular)
                    .foregroundColor(.myMint)
                    .frame(width: screenWidth)
            }
            .buttonStyle(.plain)
            
        }
        .navigationTitle("환불 규정 안내")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
    }
}

struct ReservationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RefundPolicySheetView()
                .environmentObject(ReservationStore())
        }
    }
}
