//
//  PlaceInfomationButtonView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/05.
//

import SwiftUI

struct PlaceInfomationButtonView: View {
    var buttonName: String
    var buttonImageString: String
    @State var isClicked: Bool
    
    var body: some View {
        
        Button {
            withAnimation {
                isClicked.toggle()
            }
        } label: {
            VStack{
                Image(systemName: buttonImageString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 30)
                    .foregroundColor(isClicked ? .black : .gray)
                
                Text(buttonName)
                    .font(.title3)
                    .bold()
                    .padding()
                    .fixedSize()
            }
        }
        .buttonStyle(.plain)
        .padding()
    }
}

struct PlaceInfomationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceInfomationButtonView(buttonName: "사람", buttonImageString: "person", isClicked: false)
    }
}
