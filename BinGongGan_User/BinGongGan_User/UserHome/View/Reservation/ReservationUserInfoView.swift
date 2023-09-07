//
//  ReservationUserInfoView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/07.
//

import SwiftUI

struct ReservationUserInfoView: View {
    
    @State private var reservationName: String = ""
    @State private var reservationPhoneNumber: String = ""
    
    @State private var reservationRequest: String = ""
    
    @FocusState private var isTextMasterFocused: Bool
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        Text("시간")
            .font(.body1Regular)
        
        ReservationPlusMinusButton(contentLabel: "시간")
            .padding(.bottom, 10)
        
        Text("인원")
            .font(.body1Regular)
        
        ReservationPlusMinusButton(contentLabel: "명")
            .padding(.bottom, 10)
        
        
        Text("입금자명")
            .font(.body1Regular)
        CustomTextField(placeholder: "입금자명을 입력하세요", text: .constant(reservationName))
            .keyboardType(.numberPad)
            .frame(width: screenWidth - 50, height: 50)
            .padding(.bottom, 10)
        
        
        Text("연락처")
            .font(.body1Regular)
        CustomTextField(placeholder: "연락처를 입력하세요", text: .constant(reservationPhoneNumber))
            .keyboardType(.numberPad)
            .frame(width: screenWidth - 50, height: 50)
            .padding(.bottom, 10)
        
        
        Text("요청사항")
            .font(.body1Regular)
        ZStack(alignment: .topLeading) {
            
            TextMaster(
                text: $reservationRequest,
                isFocused: $isTextMasterFocused,
                minLine: 3,
                maxLine: 5,
                fontSize: 14)
            .background(.white)
            .cornerRadius(8)
            .padding(.bottom, 10)
            
            
            if reservationRequest.isEmpty {
                Text("요청사항을 작성해주세요")
                    .font(.captionRegular)
                    .foregroundColor(.myLightGray)
                    .padding([.top,.leading], 10)
            }
        }
    }
}

struct ReservationUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationUserInfoView()
    }
}
