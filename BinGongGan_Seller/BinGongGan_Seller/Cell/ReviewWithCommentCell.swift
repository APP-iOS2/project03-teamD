//
//  ReviewWithCommentCell.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/06.
//

import SwiftUI

struct ReviewWithCommentCell: View {
    @State private var sellerComment: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("공간 이름")
                    .fontWeight(.bold)
                Spacer()
                Text("9/1 작성")
            }
            
            HStack {
                ForEach(1...5, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("리뷰 내용")
                Spacer()
            }
            
            Spacer(minLength: 50)
            
            Divider()
            
            HStack {
                TextField("댓글을 작성하세요.", text: $sellerComment, axis: .vertical)
                Button {
                    // TODO: 댓글 업로드 로직 작성하기
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
        ReviewWithCommentCell()
    }
}
