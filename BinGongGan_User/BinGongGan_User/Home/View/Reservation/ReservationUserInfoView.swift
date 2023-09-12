//
//  ReservationUserInfoView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/07.
//

import SwiftUI
import BinGongGanCore

struct ReservationUserInfoView: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    @State private var reservationName: String = ""
    @State private var reservationPhoneNumber: String = ""
    @State private var reservationRequest: String = ""
    
    @State var phoneNumber:Int? = nil
    
    private let screenWidth = UIScreen.main.bounds.width
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimum = .init(integerLiteral: 1)
        formatter.maximum = .init(integerLiteral: 11)
        formatter.generatesDecimalNumbers = false
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
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
            .keyboardType(.decimalPad)
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
                self.endTextEditing()
            } label: {
                Text("완료")
                    .padding(.trailing, 20)
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
                .onChange(of: reservationRequest) { newValue in
                    reservationStore.updateReservation(type: .reservationRequest, value: newValue)
                }
        }
    }
}

struct ReservationUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationUserInfoView()
            .environmentObject(ReservationStore())
    }
}
