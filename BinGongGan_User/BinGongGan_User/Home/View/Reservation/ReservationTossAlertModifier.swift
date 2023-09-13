//
//  ReservationTossAlertModifier.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/13.
//

import SwiftUI

struct TossAlertModifier: ViewModifier {

  @Binding var isPresented: Bool
  let title: String
  let content: String
  let primaryButtonTitle: String
  let primaryAction: () -> Void

  func body(content: Content) -> some View {
    ZStack {
      content

      ZStack {
        if isPresented {
          Rectangle()
            .fill(.black.opacity(0.5))
            .blur(radius: isPresented ? 2 : 0)
            .ignoresSafeArea()
            .onTapGesture {
              self.isPresented = false // 외부 영역 터치 시 내려감
            }

            ReservationTossAlert(
            isPresented: self.$isPresented,
            title: self.title,
            content: self.content,
            primaryButtonTitle: self.primaryButtonTitle,
            primaryAction: self.primaryAction
          )
            .transition(.fly)
        }
      }
      .animation(
        isPresented
        ? .spring(response: 0.3)
        : .none,
        value: isPresented
      )
    }
  }
}
