//
//  ReservationPlusMinusButton.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/06.
//

import SwiftUI

struct ReservationPlusMinusButton: View {
    
    @Binding var content: Int
    var contentLabel: String
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        HStack {
            Button {
                if content > 1 {
                    content = content - 1
                    print("\(content)")
                }
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(.myPrimary)
                    .frame(width: 20, height: 40)
            }
            .buttonStyle(.plain)
            
            Text("\(content) \(contentLabel)")
                .frame(width: screenWidth - 110, height: 40)
                .background(.white)
                .cornerRadius(8)
            
            Button {
                content = content + 1
                print("\(content)")
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
        ReservationPlusMinusButton(content: .constant(1), contentLabel: "시간")
    }
}
