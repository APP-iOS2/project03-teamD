//
//  AnnouncementOptionCell.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI
import BinGongGanCore

struct AnnouncementOptionCell: View {
    static var screenWidth = UIScreen.main.bounds.width
    static var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        Form {
            Section {
                ForEach(2..<4) { index in
                    Button {} label: {
                        HStack{
                            Text("")
                            Image(systemName: AnnouncementOption.data[index].optionIamge)
                            Text(AnnouncementOption.data[index].option)
                        }
                        .padding(.vertical, 10)
                        .foregroundColor(index == 2 ? Color.myBlack : Color.red)
                    }
                    .listRowBackground(Color.myVeryLightGrayColor)
                }
            }
        }
        .scrollDisabled(true)
        .scrollContentBackground(.hidden)
    }
}

struct AnnouncementOptionCell_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementOptionCell()
    }
}
