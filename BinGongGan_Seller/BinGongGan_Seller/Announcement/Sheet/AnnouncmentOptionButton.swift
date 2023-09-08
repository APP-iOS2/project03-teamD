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
    let grayColor = Color(red: 235/255, green: 238/255, blue: 242/255)
    
    var body: some View {
        Button {
        } label: {
            Rectangle()
                .fill(grayColor)
                .frame(width: AnnouncementOptionCell.screenWidth * 0.4, height: AnnouncementOptionCell.screenWidth * 0.2)
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
