////
////  DetailReviewRowView.swift
////  BinGongGan_User
////
////  Created by 임대진 on 2023/09/11.
////
//
//import SwiftUI
//import BinGongGanCore
//
//
//struct DetailReviewRowView: View {
//    var text: String
//    var foldedText: String {
//        let endIndex = text.index(text.startIndex, offsetBy: 20)
//        if text.count <= 10 {
//            return text
//        }else {
//            return "\(text[...endIndex]) ..."
//        }
//    }
//    var imageList: [String] = ["SignInLogo", "SignInLogo", "SignInLogo", "SignInLogo", "SignInLogo"]
//    @State private var isFolded: Bool = true
//    
//    var body: some View {
//        VStack(alignment: .leading){
//            ZStack {
////                NavigationLink {
//////                    GongGanDetailView()
////                } label: {
////
////                }
//            }
//            .opacity(0)
//            HStack(alignment: .bottom) {
//                
//
//                VStack(alignment: .leading) {
//                    Text("공간 이름")
//                        .font(.body1Bold)
//                        .foregroundColor(.myBlack)
//                    HStack(alignment: .bottom) {
//                        ForEach(0..<5, id: \.self) { index in
//                            Image(systemName: "star.fill")
//                                .foregroundColor(.yellow)
//                                .padding(.horizontal, -3)
//                        }
//                        Text(" | ")
//                        Text("2023.01.01 작성")
//                    }
//                    .foregroundColor(.myDarkGray)
//                    .font(.captionRegular)
//                }
//            }
//            ScrollView(.horizontal) {
//                HStack {
//                    ForEach(imageList, id:\.self) { image in
//                        Image(image)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: UIScreen.main.bounds.height * 0.2)
//                            .overlay {
//                                RoundedRectangle(cornerRadius: 15)
//                                    .stroke()
//                            }
//                    }
//                }
//            }
//            Group{
//                Text(isFolded ? foldedText : text)
//                + Text(isFolded ? " 더보기" : " 접기")
//                    .foregroundColor(.myDarkGray)
//                    .font(.body1Regular)
//            }
//            .onTapGesture {
//                isFolded.toggle()
//            }
//        }
//        .padding(.horizontal)
//    }
//}
//
//struct DetailReviewRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailReviewRowView(text: "맛있어요")
//    }
//}
