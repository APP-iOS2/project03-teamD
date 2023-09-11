//
//  ReservationUserInfoView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/07.
//

import SwiftUI

struct ReservationUserInfoView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    @State private var reservationName: String = ""
    @State private var reservationPhoneNumber: String = ""
    
    @State private var reservationRequest: String = ""
    
    @FocusState private var isTextMasterFocused: Bool
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("시간")
                .font(.body1Regular)
            Text("하루 이용시간 / 24시간 기준")
                .font(.captionRegular)
        }
        
        ReservationPlusMinusButton(contentLabel: "시간", type: "time")
            .padding(.bottom, 10)
        
        
        VStack(alignment: .leading) {
            Text("인원")
                .font(.body1Regular)
            Text("최대 13명 / 초과시 10000원 추가비용 발생")
                .font(.captionRegular)
        }
        
        ReservationPlusMinusButton(contentLabel: "명", type: "person")
            .padding(.bottom, 10)
        
        
        Text("입금자명")
            .font(.body1Regular)
        
        CustomTextField(placeholder: "입금자명을 입력하세요", text: $reservationName)
            .frame(width: screenWidth * 0.9, height: 50)
            .padding(.bottom, 10)
            .onChange(of: reservationName, perform: { newValue in
               reservationStore.updateReservation(type: .reservationName, value: newValue)
            })
        
        
        Text("연락처")
            .font(.body1Regular)
        
        CustomTextField(placeholder: "연락처를 입력하세요", text: $reservationPhoneNumber)
            .keyboardType(.numberPad)
            .frame(width: screenWidth * 0.9, height: 50)
            .padding(.bottom, 10)
            .onChange(of: reservationPhoneNumber, perform: { newValue in
               reservationStore.updateReservation(type: .reservationPhoneNumber, value: newValue)
            })
        
        HStack {
            
            Text("요청사항")
                .font(.body1Regular)
            
            Spacer()
            
            Button {
                reservationStore.updateReservation(type: .reservationRequest, value: reservationRequest)
                print("click")
            } label: {
                Text("완료")
                .onTapGesture { self.endTextEditing() }
            }
        }
        
        ZStack(alignment: .topLeading) {
            
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .frame(maxWidth: screenWidth * 0.9, minHeight: 120)
                .padding(.bottom, 10)
            
            TextField("요청사항을 작성해주세요", text: $reservationRequest, axis: .vertical)
                .font(.captionRegular)
                .lineLimit(4)
                .frame(width: screenWidth * 0.8)
                .padding([.top,.leading], 20)
        }
        .onTapGesture {
            isTextMasterFocused.toggle()
        }
    }
}

struct ReservationUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationUserInfoView()
            .environmentObject(ReservationStore())
    }
}
