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
    
    var body: some View {
        Button {
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
        .buttonStyle(.plain)
    }
}

struct AnnouncementOptionButton_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementOptionButton(announcementOption: AnnouncementOption.data[0])
    }
}
