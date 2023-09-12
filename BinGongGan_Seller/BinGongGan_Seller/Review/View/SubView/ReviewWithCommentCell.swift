//
//  ReviewWithCommentCell.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct ReviewWithCommentCell: View {
    @EnvironmentObject var replyStore: ReplyStore
    
    @State private var sellerComment: String = ""
    
    var review: Review
    
    var body: some View {
        VStack {
            HStack {
                Text("\(review.placeId)")
                    .fontWeight(.bold)
                Spacer()
                Text("\(review.date)")
            }
            
            HStack {
                ForEach(1...5, id: \.self) { star in
                    Image(systemName: "star.fill")
                        .foregroundColor(star < review.rating ? .yellow : .myLightGray)
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("\(review.content)")
                Spacer()
            }
            
            Spacer(minLength: 50)
            
            Divider()
            
            HStack {
                TextField("댓글을 작성하세요.", text: $sellerComment, axis: .vertical)
                Button {
                    // TODO: 댓글 업로드 로직 작성하기
                    let currentDate: Date = Date()
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy.MM.dd EEE"
                    dateFormatter.locale = Locale(identifier: "ko_KR")
                    
                    let newReply: Reply = Reply(
                        reviewId: "",
                        content: sellerComment,
                        date: dateFormatter.string(from: currentDate)
                    )
                    replyStore.uploadReply(newReply: newReply)
                } label: {
                    Text("게시")
                        .foregroundColor(sellerComment.isEmpty ? .gray : .blue)
                }
                .disabled(sellerComment.isEmpty)
            }
        }
        .padding()
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(15)
    }
}

struct ReviewWithCommentCell_Previews: PreviewProvider {
    static var previews: some View {
        ReviewWithCommentCell(review:
                                Review(
                                    placeId: "1B7F6970-EEC1-4244-8D4F-9F8F047F124F",
                                    writerId: "xll3TbjPUUZOtWVQx2tsetWlvpV2",
                                    date: "2023.09.12 화",
                                    rating: 5,
                                    content: "리뷰인데 아닌데? 아니긴 뭐가 아니야 맞으면서 넌 리뷰야 리뷰!"
                                )
        )
            .environmentObject(ReplyStore())
    }
}
