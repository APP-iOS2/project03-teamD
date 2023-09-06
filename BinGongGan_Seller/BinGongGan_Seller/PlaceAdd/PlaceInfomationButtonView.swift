//
//  PlaceInfomationButtonView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/05.
//

import SwiftUI

struct PlaceInfomationButtonView: View {
    @Binding var infomation: PlaceInfomationModel
    
    var body: some View {
        Button {
            withAnimation {
                infomation.isSelected.toggle()
            }
        } label: {
            VStack{
                Image(systemName: infomation.imageString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 30)
                    .foregroundColor(infomation.isSelected ? infomation.color : .gray)
                
                Text(infomation.name)
                    .font(.title3)
                    .bold()
                    .padding()
                    .fixedSize()
                    .foregroundColor(infomation.isSelected ? infomation.color : .gray)
            }
        }
        .buttonStyle(.plain)
        .padding()
    }
}

struct PlaceInfomationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceInfomationButtonView(infomation: .constant(PlaceInfomationModel.data[0]))
    }
}
