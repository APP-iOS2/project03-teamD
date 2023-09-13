//
//  MyReviewRowView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct MyReviewRowView: View {
    @EnvironmentObject private var myReviewStore: MyReviewStore
    
    @State private var isFolded: Bool = true
    @State private var isShowingDetailView: Bool = false
    @State private var isShowingRemoveAlert: Bool = false
    @State private var reply: Reply?
    @State var place: Place?
    
    var review: Review
    var limitTextLength: Int = 20
    var foldedText: String {
        if review.content.count <= limitTextLength {
            return review.content
        }else {
            let endIndex = review.content.index(review.content.startIndex, offsetBy: limitTextLength)
            return "\(review.content[...endIndex]) ..."
        }
    }
    var isLimitTextLength: Bool {
        if review.content.count <= limitTextLength {
            return false
        }else {
            return true
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Button {
                        isShowingDetailView.toggle()
                    } label: {
                        Text((place?.placeName ?? "공간 이름") + " >")
                            .font(.body1Bold)
                            .foregroundColor(.black)
                    }
                    .buttonStyle(.plain)
                    HStack(alignment: .bottom) {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .foregroundColor(index < review.rating ? .yellow : .myLightGray)
                                .padding(.horizontal, -3)
                        }
                        Text(" | ")
                        Text(review.date)
                    }
                    .foregroundColor(.myDarkGray)
                    .font(.captionRegular)
                    .padding(.bottom, 5)
                }
                
                Spacer()
                
                Button {
                    isShowingRemoveAlert.toggle()
                } label: {
                    Text("삭제")
                        .font(.captionBold)
                        .foregroundColor(.white)
                }
                .buttonStyle(.plain)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor( .myBrown)
                )
            }
            
            HStack(alignment: .bottom) {
                Text(isFolded ? foldedText : review.content)
                if isLimitTextLength {
                    Spacer()
                    Text(isFolded ? " 더보기" : " 접기")
                        .foregroundColor(.myDarkGray)
                        .font(.body1Regular)
                }
            }
            .onTapGesture {
                isFolded.toggle()
            }
            if let images = review.reviewImageStringList {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(images, id:\.self) { imageUrl in
                            let url = URL(string: imageUrl)
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: UIScreen.main.bounds.height * 0.15)
                                    .cornerRadius(15)

                                    .padding(.bottom, 10)
                            } placeholder: {
                                ProgressView()
                            }

                        }
                    }
                }
            }
            if let reply = self.reply {
                MyReviewReplyView(reply: reply)
            }
        }
        .navigationDestination(isPresented: $isShowingDetailView) {
            GongGanDetailView(placeId: review.placeId)
        }
        .alert("리뷰 삭제", isPresented: $isShowingRemoveAlert) {
            Button("취소", role: .cancel) {}
            Button("삭제", role: .destructive) {
                Task {
                    try await myReviewStore.removeReview(reviewId: review.id)
                }
            }
        }message: {
            Text("작성한 리뷰를 삭제합니다.")
        }
        .task {
            self.reply = try? await myReviewStore.findReply(reviewId: review.id)
            self.place = try? await myReviewStore.getPlaceInfo(placeId: review.placeId)
        }
    }
}

struct MyReviewRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewRowView(review: Review(placeId: "1B7F6970-EEC1-4244-8D4F-9F8F047F124F", writerId: "xll3TbjPUUZOtWVQx2tsetWlvpV2", date: "2023.09.12 화", rating: 4, content: "asdnfjknasdjkvnmzxcnvjkandjkv askjdnfkjhnasdjkfnasdjknfgjkqnjksdnjkagnjklasd", reviewImageStringList: ["https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfNDYg/MDAxNjQ2MDk1MDI1OTQy.eu3BCy6F2TpqJfdvCg27njjoRgzPvmYnkpUmVtv8RJsg.BpYYh0MjOT6Gq9i1PrDf213X_mtQ9XR04IEeV4Dk6Lcg.JPEG.awawa11/IMG_9518.jpg?type=w800"]) )
            .environmentObject(MyReviewStore())
    }
}

struct MyReviewReplyView: View {
    var reply: Reply
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("사장님 이름")
                    .font(.body1Bold)
                Text(reply.date)
                    .font(.captionRegular)
                    .foregroundColor(.myDarkGray)
            }
            .padding(.bottom, 5)
            Text(reply.content)
                .font(.body1Regular)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.myLightGray2)
        )
    }
}
