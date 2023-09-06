//
//  MyReviewRowView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct MyReviewRowView: View {
    var text: String
    var foldedText: String {
        let endIndex = text.index(text.startIndex, offsetBy: 20)
        if text.count <= 10 {
            return text
        }else {
            return "\(text[...endIndex]) ..."
        }
    }
    @State private var isFolded: Bool = true
    var body: some View {
        VStack(alignment: .leading){
            Text("공간 이름")
                .font(.body1Bold)
            HStack(alignment: .lastTextBaseline) {
                ForEach(0..<5, id: \.self) { index in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.horizontal, -3)
                }
                Text("9/1 작성")
                    .foregroundColor(.myDarkGray)
            }
            .font(.captionRegular)
            .padding(.bottom, 10)

            Group{
                Text(isFolded ? foldedText : text)
                + Text(isFolded ? " 더보기" : " 접기")
                    .foregroundColor(.myDarkGray)
                    .font(.body1Regular)
            }
            .onTapGesture {
                isFolded.toggle()
            }
        }
    }
}

struct MyReviewRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewRowView(text: "리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.")
    }
}
