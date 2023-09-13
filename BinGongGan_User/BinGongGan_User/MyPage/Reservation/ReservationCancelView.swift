//
//  ReservationCancelView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI

struct ReservationCancelView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var cancelText: String = ""
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        VStack {
            Form {
                Section("환불 계좌 및 환불 금액") {
                    VStack(alignment: .leading) {
                        Text("방유빈")
                            .font(.body1Bold)
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                        HStack {
                            Image(systemName: "phone.fill")
                            Text("010-1234-5678")
                                .font(.captionRegular)
                        }
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                        HStack {
                            Image(systemName: "creditcard.fill")
                            Text("국민 46390204174780 (방유빈)")
                                .font(.captionRegular)
                        }
                    }
                }
                
                Section("취소 사유") {
                    ZStack(alignment: .topLeading) {
                        if cancelText.isEmpty {
                            Text("취소 사유를 입력해주요.")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(EdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4))
                        }
                        TextEditor(text: $cancelText)
                            .frame(height: UIScreen.main.bounds.height * 0.04)
                    }
                    
                }
                
                Section("환불 규정") {
                    VStack(alignment: .leading , spacing: 5 ) {
                        Text("24시간 전 : 취소 수수료 없음")
                        Text("12시간 전 : 취소 수수료 10%")
                        Text("6시간 전 : 취소 수수료 30%")
                        Text("2시간 전 : 취소 불가 (호스트 문의)")
                            .foregroundColor(.black).bold()
                    }.font(.captionRegular)
                        .foregroundColor(.myDarkGray)
                }
                Button {
                    isShowingAlert = true
                } label: {
                    HStack {
                        Spacer()
                        Text("예약 취소")
                            .foregroundColor(.red)
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("예약 취소")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .alert("예약을 취소하시겠습니까?", isPresented: $isShowingAlert) {
            Button("돌아가기", role: .cancel) {}
            Button("예약취소", role: .destructive) {
                //TODO: 리뷰 저장 로직
                dismiss()
                
            }
        } message: {
            Text("취소하면 즉시 예약이 취소됩니다.")
        }
    }
}

struct ReservationCancelView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCancelView()
    }
}
