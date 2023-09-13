//
//  ReplyDetailView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/14.
//

import SwiftUI
import BinGongGanCore

struct ReplyDetailView: View {
    var reply: AdminReply
    
    var body: some View {
        Form {
            Section("답변") {
                VStack(alignment: .leading) {
                    Text(reply.reply.date)
                        .foregroundColor(.myDarkGray)
                        .font(.body1Regular)
                    Text(reply.reply.content)
                        .font(.head1Bold)
                }
            }
            Section("답변달린 댓글") {
                VStack(alignment: .leading) {
                    HStack {
                        Text(reply.writer.name)
                        Text(reply.review.date)
                            .foregroundColor(.myDarkGray)
                            .font(.body1Regular)
                    }
                    HStack {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .foregroundColor(index < reply.review.rating ? .yellow : .myLightGray)
                                .padding(.horizontal, -3)
                        }
                    }
                    .padding(.bottom)
                    Text(reply.review.content)
                        .font(.head1Bold)
                    if let images = reply.review.reviewImageStringList {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(images, id: \.self) { url in
                                    AsyncImage(url: URL(string: url)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 100)
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
            Section("공간 정보") {
                HStack {
                    Text("이름")
                        .bold()
                    Spacer()
                    Text(reply.place.placeName)
                }
                HStack {
                    Text("카테고리")
                        .bold()
                    Spacer()
                    Text(reply.place.placeCategory)
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(reply.place.placeImageStringList, id: \.self) { url in
                            AsyncImage(url: URL(string: url)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .cornerRadius(15)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("주소")
                        .bold()
                    Text(reply.place.address.address)
                    Text(reply.place.address.placeName)
                }
            }
        }
        .navigationTitle("답변 내용")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct ReplyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReplyDetailView(reply: AdminReply(reply: Reply(id: "111", content: "ㄴㅁㅇㅁㄴ", date: "2023.09.13 수"), review: Review(placeId: "dddd", writerId: "LPH9N7snDhgUjvDMGCg3ZW3moOR2", date: "2023.09.12 화", rating: 4, content: "쿠쿠루삥뽕 좋았습", reviewImageStringList: ["https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfNDYg/MDAxNjQ2MDk1MDI1OTQy.eu3BCy6F2TpqJfdvCg27njjoRgzPvmYnkpUmVtv8RJsg.BpYYh0MjOT6Gq9i1PrDf213X_mtQ9XR04IEeV4Dk6Lcg.JPEG.awawa11/IMG_9518.jpg?type=w800", "https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfMjI5/MDAxNjQ2MDk1MDI0NzI4.CmtFon2i5s_MutSbTq2O1uKTnJyELjx9O8JgOqKXuWYg.0MJCSOGMpVwCaeHF4wgUJD_rXpMNFvjZxIdBA55Qj0Eg.JPEG.awawa11/IMG_9524.jpg?type=w800"]), place: Place(sellerId: "ssss", placeName: "꽁간", placeCategory: "밴드룸", placeImageStringList: ["https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfNDYg/MDAxNjQ2MDk1MDI1OTQy.eu3BCy6F2TpqJfdvCg27njjoRgzPvmYnkpUmVtv8RJsg.BpYYh0MjOT6Gq9i1PrDf213X_mtQ9XR04IEeV4Dk6Lcg.JPEG.awawa11/IMG_9518.jpg?type=w800", "https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfMjI5/MDAxNjQ2MDk1MDI0NzI4.CmtFon2i5s_MutSbTq2O1uKTnJyELjx9O8JgOqKXuWYg.0MJCSOGMpVwCaeHF4wgUJD_rXpMNFvjZxIdBA55Qj0Eg.JPEG.awawa11/IMG_9524.jpg?type=w800"], note: ["짱좋음", "애플펀치"], placeInfomationList: ["??", "??"], address: Address(address: "ssss", placeName: "사관 건물", longitude: "222", latitude: "222")), writer: User(id: "LPH9N7snDhgUjvDMGCg3ZW3moOR2", email: "asdjoa@email.com", name: "ddd", nickname: "nickname", phoneNumber: "01011111111", password: "11111111", birthDate: "2000.01.22")))
    }
}
