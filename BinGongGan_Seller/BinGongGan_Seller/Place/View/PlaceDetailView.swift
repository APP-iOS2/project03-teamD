//
//  PlaceDetailView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/12.
//

import SwiftUI
import BinGongGanCore

struct PlaceDetailView: View {
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            VStack {
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .customBackbutton()
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView()
    }
}
