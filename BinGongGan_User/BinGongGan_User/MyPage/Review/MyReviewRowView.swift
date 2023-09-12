//
//  MyReviewRowView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct MyReviewRowView: View {
    @State private var isFolded: Bool = true
    @State private var isShowingDetailView: Bool = false
    @State private var isShowingRemoveAlert: Bool = false
    
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
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Button {
                        isShowingDetailView.toggle()
                    } label: {
                        Text("공간 이름 >")
                            .font(.body1Bold)
                            .foregroundColor(.black)
                    }
                    .buttonStyle(.plain)
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
            
            Group{
                Text(isFolded ? foldedText : text)
                + Text(isFolded ? " 더보기" : " 접기")
                    .foregroundColor(.myDarkGray)
                    .font(.body1Regular)
            }
            .onTapGesture {
                isFolded.toggle()
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(imageList, id:\.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height * 0.15)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke()
                            }
                    }
                }
            }
            .padding(.bottom, 10)
            .navigationDestination(isPresented: $isShowingDetailView) {
                GongGanDetailView()
            }
            .alert("리뷰 삭제", isPresented: $isShowingRemoveAlert) {
                Button("취소", role: .cancel) {}
                Button("삭제", role: .destructive) {
                    //TODO: 리뷰 삭제 로직
                    
                }
            }message: {
                Text("작성한 리뷰를 삭제합니다.")
            }
            MyReviewReplyView()
        }
    }
}

struct MyReviewRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewRowView(text: "리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.리뷰임둥.")
    }
}

struct MyReviewReplyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("사장님 이름")
                    .font(.body1Bold)
                Text("어제")
                    .font(.captionRegular)
                    .foregroundColor(.myDarkGray)
            }
            .padding(.bottom, 5)
            Text("답글답글\n찾아주셔서 감사합니다.")
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
