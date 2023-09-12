//
//  EasterEggAlert.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/12.
//

import SwiftUI

struct EasterEggAlert: View {

  @Binding var isPresented: Bool
  let title: String
  let primaryButtonTitle: String
  let primaryAction: () -> Void

  var body: some View {
    VStack(spacing: 22) {
      Image("mungmoongE")
        .resizable()
        .scaledToFit()
        .frame(width: 80)

      Text(title)
        .font(.title)
        .bold()
        .foregroundColor(.black)

      Divider()
      Button {
        primaryAction()
        isPresented = false
      } label: {
        Text(primaryButtonTitle)
          .font(.title3)
          .bold()
          .padding(.vertical, 8)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 18)
    .frame(width: 300)
    .background(
      RoundedRectangle(cornerRadius: 30)
        .stroke(.blue.opacity(0.5))
        .background(
          RoundedRectangle(cornerRadius: 30)
            .fill(.white)
        )
    )
  }
}

