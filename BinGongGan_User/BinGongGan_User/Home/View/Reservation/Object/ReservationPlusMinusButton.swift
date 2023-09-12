//
//  ReservationPlusMinusButton.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/06.
//

import SwiftUI

struct ReservationPlusMinusButton: View {
    
    @EnvironmentObject var reservationStore: ReservationStore
    @State private var content: Int = 1
    
    var contentLabel: String
    var type: String
    
    var contentColor: Color {
        if type == "time" {
            if content == 24 {
                return Color.myLightGray
            }
        } else if type == "person" {
            if content == 13 {
                return Color.myLightGray
            }
        }
        return Color.myBrown
    }
    
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        HStack {
            Button {
                if content > 1 {
                    content -= 1
                    
                    if type == "time" {
                        reservationStore.updateReservation(type: .hour, value: content)
                        
                    } else if type == "person" {
                        reservationStore.updateReservation(type: .personnel, value: content)
                    }
                }
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(content == 1 ? Color.myLightGray : Color.myBrown)
                    .frame(width: 20, height: 40)
            }
            .buttonStyle(.plain)
            
            Text("\(content) \(contentLabel)")
                .font(.captionRegular)
                .frame(width: screenWidth * 0.8, height: 40)
                .background(.white)
                .cornerRadius(8)
            
            Button {
                if type == "time" {
                    if content < 24 {
                        content += 1
                        
                        reservationStore.updateReservation(type: .hour, value: content)
                    }
                } else if type == "person" {
                    if content < 13 {
                        content += 1
                        
                        reservationStore.updateReservation(type: .personnel, value: content)
                    }
                } else {
                    content += 1
                }
                
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(contentColor)
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
