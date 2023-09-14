//
//  ReviewDetailView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct ReviewDetailView: View {
    var review: AdminReview
    var body: some View {
        Form {
            Section("댓글 내용") {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            //MARK: - 공간 데이터 연결 시 변경
                            Text("공간 이름")
                                .font(.body1Bold)
                                .foregroundColor(.black)
                            HStack(alignment: .bottom) {
                                ForEach(0..<5, id: \.self) { index in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(index < review.review.rating ? .yellow : .myLightGray)
                                        .padding(.horizontal, -3)
                                }
                                Text(" | ")
                                Text(review.review.date)
                            }
                            .foregroundColor(.myDarkGray)
                            .font(.captionRegular)
                            .padding(.bottom, 5)
                        }
                    }
                    
                    if let imageList = review.review.reviewImageStringList{
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach(imageList, id: \.self) { url in
                                    AsyncImage(url: URL(string: url)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .cornerRadius(15)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            Section("작성자 정보") {
                HStack {
                    Text("이름")
                        .font(.body1Regular)
                    Spacer()
                    Text(review.writer.name)
                        .foregroundColor(.myDarkGray)
                }
                HStack {
                    Text("닉네임")
                        .font(.body1Regular)
                    Spacer()
                    Text(review.writer.nickname)
                        .foregroundColor(.myDarkGray)
                }
                HStack {
                    Text("연락처")
                        .font(.body1Regular)
                    Spacer()
                    Text(review.writer.phoneNumber)
                        .foregroundColor(.myDarkGray)
                }
                HStack {
                    Text("아이디")
                        .font(.body1Regular)
                    Spacer()
                    Text(review.writer.email)
                        .tint(.myDarkGray)
                }
                HStack {
                    Text("생년월일")
                        .font(.body1Regular)
                    Spacer()
                    Text(review.writer.birthDate)
                        .foregroundColor(.myDarkGray)
                }
            }
        }
        .navigationTitle("댓글 정보")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct ReviewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewDetailView(review: AdminReview(review: Review(placeId: "dddd", writerId: "LPH9N7snDhgUjvDMGCg3ZW3moOR2", date: "2023.09.12 화", rating: 4, content: "쿠쿠루삥뽕 좋았습", reviewImageStringList: ["https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfNDYg/MDAxNjQ2MDk1MDI1OTQy.eu3BCy6F2TpqJfdvCg27njjoRgzPvmYnkpUmVtv8RJsg.BpYYh0MjOT6Gq9i1PrDf213X_mtQ9XR04IEeV4Dk6Lcg.JPEG.awawa11/IMG_9518.jpg?type=w800", "https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfMjI5/MDAxNjQ2MDk1MDI0NzI4.CmtFon2i5s_MutSbTq2O1uKTnJyELjx9O8JgOqKXuWYg.0MJCSOGMpVwCaeHF4wgUJD_rXpMNFvjZxIdBA55Qj0Eg.JPEG.awawa11/IMG_9524.jpg?type=w800"]), writer: User(id: "LPH9N7snDhgUjvDMGCg3ZW3moOR2", email: "asdjoa@email.com", name: "ddd", nickname: "nickname", phoneNumber: "01011111111", password: "11111111", birthDate: "2000.01.22")))
        }
    }
}

