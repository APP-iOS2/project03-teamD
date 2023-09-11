//
//  HeartButton.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/11.
//

import SwiftUI

struct HeartButton: View {
    @Binding var place: Place
    var body: some View {
        Button {
            place.isFavorite.toggle()
        } label: {
            Image(systemName: place.isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .font(.system(size: 22))
        }
    }
}

