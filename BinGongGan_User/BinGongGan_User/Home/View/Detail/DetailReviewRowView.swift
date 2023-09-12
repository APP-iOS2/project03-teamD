//
//  DetailReviewRowView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct DetailReviewRowView: View {
    @State private var isFolded: Bool = true
    var text: String
    var imageList: [String] = ["SignInLogo", "SignInLogo", "SignInLogo"]
    var foldedText: String {
        let endIndex = text.index(text.startIndex, offsetBy: 20)
        if text.count <= 20 {
            return text
        } else {
            return "\(text[..<endIndex]) ..."
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("작성자 닉네임")
                        .font(.body1Bold)
                        .foregroundColor(.black)
                    
                    HStack(alignment: .bottom) {
                        ForEach(0..<3, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .padding(.horizontal, -3)
                        }
                        Text(" | ")
                        Text("2023.01.01 작성")
                    }
                    .foregroundColor(.myDarkGray)
                    .font(.captionRegular)
                    
                }
            }
            
            VStack{
                if text.count <= 20 {
                    Text(text)
                        .foregroundColor(.myDarkGray)
                        .font(.body1Regular)
                } else {
                    Group {
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
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(imageList, id:\.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height * 0.1)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke()
                            }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct DetailReviewRowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailReviewRowView(text: "맛있어요ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ")
    }
}
