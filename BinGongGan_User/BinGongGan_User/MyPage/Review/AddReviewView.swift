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
    @State private var reviewPhotoList: [String] = []
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        Form {
            Section {
                PlaceInfoView()
            }
            
            Section("별점") {
                HStack{
                    ForEach(0..<5, id: \.self){ index in
                        Button {
                            starRating = index + 1
                            print(index)
                        }label: {
                            Image(systemName: "star.fill")
                        }
                        .foregroundColor(index < self.starRating ? .yellow : .myLightGray)
                        .buttonStyle(.plain)
                    }
                }
            }
            
            Section("리뷰 내용") {
                TextEditor(text: $reviewText)
                    .frame(height: UIScreen.main.bounds.height * 0.2)
                    .border(.gray)
            }
            
            Section("사진 추가 (최대 5개)") {
                AddPhotoView(reviewPhotoList: $reviewPhotoList)
            }
        }
        .navigationTitle("리뷰 작성")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("완료") {
                    isShowingAlert.toggle()
                }
                .foregroundColor(.myPrimary)
            }
        }
        .alert("리뷰 작성", isPresented: $isShowingAlert) {
            Button("취소", role: .cancel) {}
            Button("저장", role: .destructive) {
                //TODO: 리뷰 저장 로직
                dismiss()
            }
        }message: {
            Text("리뷰를 저장합니다.")
        }
    }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddReviewView()
        }
    }
}

struct PlaceInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("유빈이 네")
                .font(.head1Bold)
            Text("예약 번호 : A10284901SG")
                .font(.body1Regular)
                .foregroundColor(.myDarkGray)
                .padding(.bottom, 15)
            Text("9/4 (화) 12: 00 ~ 18:00 (5명)")
                .font(.body1Regular)
                .foregroundColor(.myDarkGray)
        }
    }
}

struct AddPhotoView: View {
    @Binding var reviewPhotoList: [String]
    
    var body: some View {
        ScrollViewReader { proxy in
            HStack{
                Button {
                    //TODO: - 이미지 불러오기 로직 추가, 스크롤뷰 리더 고치기
                    if reviewPhotoList.count < 5 {
                        reviewPhotoList.append("\(reviewPhotoList.count + 1)")
                        withAnimation {
                            proxy.scrollTo(reviewPhotoList.count - 1, anchor: .center)
                        }
                    }
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.myPrimary)
                        Text("+")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }// Button
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(reviewPhotoList.indices, id:\.self) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.myPrimary)
                                    .id(index)
                                Text("\(reviewPhotoList[index])번째 이미지")
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                }// ScrollView
            }// HStack
        }// ScrollViewReder
    }
}
