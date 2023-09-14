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
    @EnvironmentObject private var myReviewStore: MyReviewStore
    @State private var starRating: Int = 0
    @State private var reviewText: String = ""
    @State private var isShowingAlert: Bool = false
    @State var selectedImages: [UIImage] = []
    
    var reservation: BinGongGanCore.Reservation
    var isDisable: Bool {
        if reviewText.isEmpty || starRating == 0 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        Form {
            Section("예약 정보") {
                PlaceInfoView(reservation: reservation)
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
                AddPhotoView(selectedImages: $selectedImages)
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
                .disabled(isDisable)
            }
        }
        
        .alert("리뷰 작성", isPresented: $isShowingAlert) {
            Button("취소", role: .none) {}
            Button("제출", role: .none) {
                    Task {
                        try await myReviewStore.addReview(placeId: reservation.placeID, rating: starRating, content: reviewText, images: selectedImages , reservationId: reservation.id)
                    }
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
            AddReviewView(reservation: MyReservationStore().reservation)
                .environmentObject(MyReservationStore())
        }
    }
}

struct PlaceInfoView: View {
    
    @EnvironmentObject private var myReservationStore: MyReservationStore
    var reservation: BinGongGanCore.Reservation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("예약 번호 : \(reservation.id)")
                .font(.captionRegular)
                .foregroundColor(.myDarkGray)
            
            Divider()
            
            
            HStack {
                Text(reservation.place?.placeName ?? "")
                    .font(.head1Bold)
            }
            
            
            
            Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
            
            HStack {
                Image(systemName: "wonsign.circle")
                    .foregroundColor(.yellow)
                Text("199,000원")
                    .font(.captionRegular)
                
            }
            Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
            
            HStack {
                Image(systemName: "calendar.badge.clock")  .foregroundColor(.blue)
                Text("\(reservation.checkInDateString) ~ \(reservation.checkOutDateString) | \(reservation.hour)시간  (\(reservation.personnel)명)")
                    .font(.captionRegular)
                    .foregroundColor(.myBrown)
                
            }
            
            Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
            
            HStack {
                Image(systemName: "mappin")
                    .foregroundColor(.red)
                Text("\(reservation.place?.address.address ?? "")")
                    .font(.captionRegular)
                
            }
        }
    }
}

