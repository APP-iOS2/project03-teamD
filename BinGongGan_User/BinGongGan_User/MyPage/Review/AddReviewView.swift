//
//  AddReviewView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct AddReviewView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var starRating: Int = 0
    @State private var reviewText: String = ""
    @State private var isShowingAlert: Bool = false
    
    var reservate: ReservationModel
    var body: some View {
        Form {
            Section("예약 정보") {
                PlaceInfoView(reservate: reservate)
            }
            
            Section("별점") {
                HStack{
                    ForEach(0..<5, id: \.self){ index in
                        Button {
                            starRating = index + 1
                        }label: {
                            Image(systemName: "star.fill")
                        }
                        .foregroundColor(index < self.starRating ? .yellow : .myLightGray)
                        .buttonStyle(.plain)
                    }
                }
            }
            
            Section("리뷰 내용") {
                ZStack(alignment: .topLeading) {
                    if reviewText.isEmpty {
                        Text("리뷰를 작성해주세요.")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(EdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4))
                    }
                    TextEditor(text: $reviewText)
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                }
                
            }
            
            Section("사진 추가 (최대 5개)") {
                AddPhotoView()
            }
        }
        .padding(.top, -20)
        .navigationTitle("리뷰 작성")
        .navigationBarTitleDisplayMode(.inline)
        .customBackbutton()
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("완료") {
                    isShowingAlert.toggle()
                }
                .foregroundColor(.myBrown)
            }
        }
        
        .alert("리뷰 작성", isPresented: $isShowingAlert) {
            Button("취소", role: .none) {}
            Button("제출", role: .none) {
                //TODO: 리뷰 저장 로직
                dismiss()
            }
        }message: {
            Text("작성한 리뷰를 저장합니다.")
        }
        .onTapGesture {
            self.endTextEditing()
        }
    }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddReviewView(reservate: ReservationModel(placeName: "희권이네 설빙", reservationNumber: "A103120235", reservationDate: "9/7 (목) 17:00 ~ 21:00", reservationTime: "", reservationPersonal: 5, placeAddress: "서울특별시 희권구", isReservation: false))
        }
    }
}

struct PlaceInfoView: View {
    
    var reservate: ReservationModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(reservate.placeName)")
                .font(.head1Bold)
            Text("예약번호: \(reservate.reservationNumber)")
                .font(.body1Regular)
                .foregroundColor(.myDarkGray)
                .padding(.bottom, 15)
            Text("\(reservate.reservationDate) (\(reservate.reservationPersonal)명)")
                .font(.body1Regular)
                .foregroundColor(.myDarkGray)
        }
    }
}

