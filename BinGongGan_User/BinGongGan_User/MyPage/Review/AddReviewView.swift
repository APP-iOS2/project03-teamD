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
    
    var body: some View {
        Form {
            Section("예약 정보") {
                PlaceInfoView()
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
            }
        }
        
        .alert("리뷰 작성", isPresented: $isShowingAlert) {
            Button("취소", role: .none) {}
            Button("제출", role: .none) {
                //TODO: 리뷰 저장 로직
                    Task {
                        try await myReviewStore.addReview(placeId: "1B7F6970-EEC1-4244-8D4F-9F8F047F124F", rating: starRating, content: reviewText, images: selectedImages)
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
            AddReviewView()
                .environmentObject(MyReservationStore())
        }
    }
}

struct PlaceInfoView: View {
    
    @EnvironmentObject private var myReservationStore: MyReservationStore
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(myReservationStore.reservation.roomID)")
                .font(.head1Bold)
            Text("예약번호: \(myReservationStore.reservation.id)")
                .font(.body1Regular)
                .foregroundColor(.myDarkGray)
                .padding(.bottom, 15)
            Text("\(myReservationStore.reservation.checkInDateString) (\(myReservationStore.reservation.personnel)명)")
                .font(.body1Regular)
                .foregroundColor(.myDarkGray)
        }
    }
}

