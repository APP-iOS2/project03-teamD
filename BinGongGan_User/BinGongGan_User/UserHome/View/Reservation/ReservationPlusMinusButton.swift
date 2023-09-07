//
//  ReservationPlusMinusButton.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/06.
//

import SwiftUI

struct ReservationPlusMinusButton: View {
    
    @State private var content: Int = 1
    
    var contentLabel: String
    var type: String
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        HStack {
            Button {
                if content > 1 {
                    content -= 1
                }
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(content == 1 ? Color.myLightGray : Color.myPrimary)
                    .frame(width: 20, height: 40)
            }
            .buttonStyle(.plain)
            
            Text("\(content) \(contentLabel)")
                .font(.captionRegular)
                .frame(width: screenWidth - 110, height: 40)
                .background(.white)
                .cornerRadius(8)
            
            Button {
                if type == "time" {
                    if content < 24 {
                        content += 1
                    }
                } else if type == "person" {
                    if content < 13 {
                        content += 1
                    }
                } else {
                    content += 1
                }
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.myPrimary)
                    .frame(width: 20, height: 40)
            }
            .buttonStyle(.plain)
        } // HStack
    }
}

struct ReservationPlusMinusButton_Previews: PreviewProvider {
    static var previews: some View {
        ReservationPlusMinusButton(contentLabel: "시간", type: "time")
    }
}
