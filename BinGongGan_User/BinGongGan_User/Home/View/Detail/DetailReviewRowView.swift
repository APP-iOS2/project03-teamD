//
//  DetailReviewRowView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct DetailReviewRowView: View {
    var review: Review
    @State private var isFolded: Bool = true
    var imageList: [String] = ["SignInLogo", "SignInLogo", "SignInLogo"]
    
    var foldedText: String {
        let endIndex = review.content.index(review.content.startIndex, offsetBy: 20)
        if review.content.count <= 20 {
            return review.content
        } else {
            return "\(review.content[..<endIndex]) ..."
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(review.writerId)
                        .font(.body1Bold)
                        .foregroundColor(.black)
                    
                    HStack(alignment: .bottom) {
                        ForEach(0..<review.rating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .padding(.horizontal, -3)
                        }
                        Text(" | ")
                        Text("\(review.date) 작성")
                    }
                    .foregroundColor(.myDarkGray)
                    .font(.captionRegular)
                    
                }
            }
            
            VStack{
                if review.content.count <= 20 {
                    Text(review.content)
                        .foregroundColor(.myDarkGray)
                        .font(.body1Regular)
                } else {
                    Group {
                        Text(isFolded ? foldedText : review.content)
                        + Text(isFolded ? " 더보기" : " 접기")
                            .foregroundColor(.myDarkGray)
                            .font(.body1Regular)
                    }
                    .onTapGesture {
                        isFolded.toggle()
                    }
                }
            }
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(imageList, id:\.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke()
                            }
                    }
                }
                .frame(height: 110)
                .padding(.leading, 5)
            }
            Divider()
        }
        .padding(.horizontal)
    }
}

struct DetailReviewRowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailReviewRowView(review: Review(placeId: "", writerId: "임대진", date: "2023.01.01 작성", rating: 3, content: "맛있어요~~", reviewImageStringList: ["SignInLogo", "SignInLogo", "SignInLogo"]))
    }
}
