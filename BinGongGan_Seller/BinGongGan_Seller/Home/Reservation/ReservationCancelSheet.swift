//
//  ReservationCancelSheet.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct ReservationCancelSheet: View {
    private let uiViewWidth = UIScreen.main.bounds.width
    
    @State var isSelectedApprovalButton: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Text("취소 내역 확인")
                    .font(.head1Bold)
                    .padding([.top, .leading], 20)
                    .foregroundColor(Color.myDarkGray)
                Spacer()
            }
            
            ReservationCell(isHiddenRightButton: false)
                .padding(.bottom, 12)
                .padding(.horizontal, 20)
            
            Spacer()
            HStack{
                Text("취소완료")
                    .font(.body1Bold)
                    .foregroundColor(.white)
            }
            .frame(width: uiViewWidth, height: 50)
            .background(Color.myBrown)
        }
        .background(Color.myBackground)
    }  
}

struct ReservationCancelSheet_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCancelSheet()
    }
}
