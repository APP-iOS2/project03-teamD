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
    @State var checkRefundPolicy: Bool = true
    
    @State private var reservationName: String = ""
    @State private var reservationPhoneNumber: String = ""
    
    @State private var reservationRequest: String = ""
    
    @FocusState private var isTextMasterFocused: Bool
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack {
            // 상단 바
            ReservationHeaderView()
                .padding(.top, 1)
            
            ScrollView {
                // 달력
                ReservationCalendarView()
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    // 시간, 인원, 입금자명, 연락처, 요청사항
                    
                    Group {
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
                    }
                    
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
                    
                    // 이용 시 주의 사항, 환불규정
                    
                    Group {
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
                                        .foregroundColor(.mySecondary)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .padding(.bottom, 10)
                    }
                    
                    Button {
                        if checkRefundPolicy {
                            //PaymentView()
                            
                            print("true 일경우 \(checkRefundPolicy)")
                        }
                    } label: {
                        Text("무통장으로 입금")
                            .frame(width: screenWidth - 40, height: 50)
                            .foregroundColor(checkRefundPolicy ? Color.white : Color.myMediumGray)
                            .background(checkRefundPolicy ? Color.myPrimary : Color.myLightGray )
                        
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                    .padding([.top, .bottom], 10)
                }
                .padding([.leading, .trailing], 20)
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
        .sheet(isPresented: $openRefundPolicySheet, content: {
            RefundPolicySheetView(checkRefundPolicy: .constant(checkRefundPolicy))
        })
        /*
         .alert(isPresented: $openRefundPolicySheet) {
         Alert(title: Text("무통장 입금"),
         message: Text("계좌번호 : 1010101010110"),
         dismissButton: .default(Text("확인"),action: {
         presentationMode.wrappedValue.dismiss()
         }))
         }
         */
        .background(Color.myBackground)
        .navigationTitle("예약화면")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.myBackground, for: .navigationBar)
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
