//
//  ToastMessage.swift
//  BinGongGan_User
//
//  Created by 마경미 on 07.09.23.
//

import SwiftUI

// Binding 사용으로 13이상
@available(iOS 13.0, *)
struct ToastMessageModifier: ViewModifier {
    @Binding var isShowing: Bool
    var message: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                VStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.myWarningColor, lineWidth: 3)
                            .foregroundColor(.white)
                            .background(Color.white)
                            .frame(width: 300, height: 50)
                            .transition(.scale)
                        
                        HStack {
                            Image(systemName: "exclamationmark.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundColor(.myWarningColor)
                                .padding(.trailing, 5)
                            Text(message)
                                .font(.captionRegular)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .padding(.bottom, 40)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
                .zIndex(1)
            }
        }
    }
}
