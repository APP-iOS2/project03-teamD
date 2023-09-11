//
//  MyReviewRowView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct MyReviewRowView: View {
    @State private var isShowingDetailView: Bool = false
    @State private var isFolded: Bool = true
    
    var text: String
    var foldedText: String {
        let endIndex = text.index(text.startIndex, offsetBy: 20)
        if text.count <= 10 {
            return text
        }else {
            return "\(text[...endIndex]) ..."
        }
    }
    var imageList: [String] = ["SignInLogo", "SignInLogo", "SignInLogo", "SignInLogo", "SignInLogo"]
    
    var body: some View {
            VStack(alignment: .leading){
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Button {
                            isShowingDetailView.toggle()
                        } label: {
                            Text("공간 이름 >")
                                .font(.body1Bold)
                                .foregroundColor(.black)
                        }
                        HStack(alignment: .bottom) {
                            ForEach(0..<5, id: \.self) { index in
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
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(imageList, id:\.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 0.2)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke()
                                }
                        }
                    }
                }
                Group{
                    Text(isFolded ? foldedText : text)
                    + Text(isFolded ? " 더보기" : " 접기")
                        .foregroundColor(.myDarkGray)
                        .font(.body1Regular)
                }
                .onTapGesture {
                    isFolded.toggle()
                }
                .navigationDestination(isPresented: $isShowingDetailView) {
                    GongGanDetailView()
                }
        }
    }
}

struct MyReviewRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewRowView(text: "리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.")
    }
}
