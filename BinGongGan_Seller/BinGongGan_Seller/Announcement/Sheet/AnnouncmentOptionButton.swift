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
    var announcement: Announcement
    
    var body: some View {
        Button {
            if announcementOption.option == AnnouncementOptionCase.share.rawValue {
                isSelectedShareButton.toggle()
            }
        } label: {
            Rectangle()
                .fill(Color.myLightGray2)
                .frame(width: UIScreen.screenWidth * 0.4, height: UIScreen.screenHeight * 0.1)
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
                        .foregroundColor(Color.myBrown)
                )
        }
        .sheet(isPresented: $isSelectedShareButton) {
            ActivityView(text: announcement.content)
                .presentationDetents([.medium])
        }
        .buttonStyle(.plain)
    }
}
