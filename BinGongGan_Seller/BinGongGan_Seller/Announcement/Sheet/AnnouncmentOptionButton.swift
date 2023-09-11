//
//  AnnouncmentOptionButton.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementOptionButton: View {
    var announcementOption: AnnouncementOption
    @State var isSelectedShareButton: Bool = false
    
    var body: some View {
        Button {
            if announcementOption.option == AnnouncementOptionCase.share.rawValue {
                isSelectedShareButton.toggle()
            }
        } label: {
            Rectangle()
                .fill(Color.myVeryLightGrayColor)
                .frame(width: AnnouncementOptionCell.screenWidth * 0.4, height: AnnouncementOptionCell.screenHeight * 0.1)
                .cornerRadius(15)
                .padding(.top, 20)
                .overlay(
                    VStack{
                        Image(systemName: announcementOption.optionIamge)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding(.top, 20)
                        
                        Text(announcementOption.option)
                            .font(.body1Regular)
                            .bold()
                            .padding(.top, 5)
                            .fixedSize()
                    }
                        .foregroundColor(Color.myPrimary)
                )
        }
        .sheet(isPresented: $isSelectedShareButton) {
            ActivityView(text: "계절이 지나가는 하늘에는 가을로 가득 차 있습니다.\n나는 아무 걱정도 없이 가을 속의 별들을 다 헤일 듯합니다.\n가슴속에 하나둘 새겨지는 별을 이제 다 못 헤는 것은 쉬이 아침이 오는 까닭이요,\n내일 밤이 남은 까닭이요,\n아직 나의 청춘이 다하지 않은 까닭입니다.\n별 하나에 추억과\n별 하나에 사랑과\n별 하나에 쓸쓸함과\n별 하나에 동경과\n별 하나에 시와\n별 하나에 어머니, 어머니")
                .presentationDetents([.medium])
        }
        .buttonStyle(.plain)
    }
}

struct AnnouncementOptionButton_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementOptionButton(announcementOption: AnnouncementOption.data[0])
    }
}
