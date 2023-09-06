//
//  ReservationView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import SwiftUI

struct ReservationView: View {
    
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var reservationStore: ReservationStore
    
    @State var openRefundPolicySheet: Bool = false
    @State var checkRefundPolicy: Bool = false
    
    @State private var checkInDate: Double = Date.timeIntervalBetween1970AndReferenceDate
    @State private var checkOutDate: Double = Date.timeIntervalBetween1970AndReferenceDate
    
    @State private var reservationTime: Int = 1
    @State private var reservationPerson: Int = 1
    
    @State private var reservationName: String = ""
    @State private var reservationPhoneNumber: String = ""
    
    @State private var reservationRequest: String = ""
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack {
            // 상단 바
            ReservationHeaderView()
            
            ScrollView {
                // 달력
                ReservationCalendarView()
                
                VStack(alignment: .leading, spacing: 20) {
                    // 시간, 인원, 입금자명, 연락처, 요청사항
                    Section("시간")  {
                        ReservationPlusMinusButton(content: .constant(reservationTime), contentLabel: "시간")
                    }
                    
                    Section("인원") {
                        ReservationPlusMinusButton(content: .constant(reservationPerson), contentLabel: "명")
                    }
                    
                    Section("입금자명") {
                        CustomTextField(placeholder: "입금자명을 입력하세요", text: .constant(reservationName))
                            .keyboardType(.numberPad)
                            .frame(width: screenWidth - 50, height: 50)
                    }
                    
                    Section("연락처") {
                        CustomTextField(placeholder: "연락처를 입력하세요", text: .constant(reservationPhoneNumber))
                            .keyboardType(.numberPad)
                            .frame(width: screenWidth - 50, height: 50)
                    }
                    
                    Section("요청사항") {
                        
                    }
                    
                    // 이용 시 주의 사항, 환불규정
                    
                    Section("이용 시 주의 사항") {
                       Text("판매자 형식 반영 제작")
                    }
                    
                    Section("환불 규정") {
                        HStack {
                            Text("환불 규정 확인하기")
                           // Spacer()
                            Button {
                                // sheet 올리기 -> sheet 속 버튼 누르면 활성화되도록
                                openRefundPolicySheet.toggle()
                            } label: {
                              Text("확인")
                                    .foregroundColor(.mySecondary)
                                    .padding(.leading, 20)
                            }
                        }
                    }
                    
                    NavigationLink {
                        if checkRefundPolicy {
                            // 결제 화면으로~
                        }
                    } label: {
                        Text("무통장으로 입금")
                            .foregroundColor(.myPrimary)
                            .frame(width: screenWidth - 40, height: 50)
                    }
                    .buttonStyle(.plain)

                }
                .padding([.top,.leading,.trailing], 10)
                
            }
            
        }
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
        }
        .background(Color.myBackground)
        .navigationTitle("예약화면")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReservationView()
                .environmentObject(ReservationStore())
        }
    }
}
